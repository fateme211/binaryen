;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.

;; RUN: wasm-opt %s -all -o %t.text.wast -g -S
;; RUN: wasm-as %s -all -g -o %t.wasm
;; RUN: wasm-dis %t.wasm -all -o %t.bin.wast
;; RUN: wasm-as %s -all -o %t.nodebug.wasm
;; RUN: wasm-dis %t.nodebug.wasm -all -o %t.bin.nodebug.wast
;; RUN: cat %t.text.wast | filecheck %s --check-prefix=CHECK-TEXT
;; RUN: cat %t.bin.wast | filecheck %s --check-prefix=CHECK-BIN
;; RUN: cat %t.bin.nodebug.wast | filecheck %s --check-prefix=CHECK-BIN-NODEBUG

(module
  ;; CHECK-TEXT:      (type $0 (func (result exnref)))

  ;; CHECK-TEXT:      (func $exnref-nullexnref-test (type $0) (result exnref)
  ;; CHECK-TEXT-NEXT:  (local $exn exnref)
  ;; CHECK-TEXT-NEXT:  (local $null-exn nullexnref)
  ;; CHECK-TEXT-NEXT:  (if (result exnref)
  ;; CHECK-TEXT-NEXT:   (i32.const 1)
  ;; CHECK-TEXT-NEXT:   (if (result nullexnref)
  ;; CHECK-TEXT-NEXT:    (i32.const 1)
  ;; CHECK-TEXT-NEXT:    (local.get $null-exn)
  ;; CHECK-TEXT-NEXT:    (ref.null noexn)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:   (local.get $exn)
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (type $0 (func (result exnref)))

  ;; CHECK-BIN:      (func $exnref-nullexnref-test (type $0) (result exnref)
  ;; CHECK-BIN-NEXT:  (local $exn exnref)
  ;; CHECK-BIN-NEXT:  (local $null-exn nullexnref)
  ;; CHECK-BIN-NEXT:  (if (result exnref)
  ;; CHECK-BIN-NEXT:   (i32.const 1)
  ;; CHECK-BIN-NEXT:   (if (result nullexnref)
  ;; CHECK-BIN-NEXT:    (i32.const 1)
  ;; CHECK-BIN-NEXT:    (local.get $null-exn)
  ;; CHECK-BIN-NEXT:    (ref.null noexn)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:   (local.get $exn)
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT: )
  (func $exnref-nullexnref-test (result exnref) (local $exn exnref) (local $null-exn nullexnref)
    (if (result exnref)
      (i32.const 1)
      (if (result nullexnref)
        (i32.const 1)
        (local.get $null-exn)
        (ref.null noexn)
      )
      (local.get $exn)
    )
  )
)
;; CHECK-BIN-NODEBUG:      (type $0 (func (result exnref)))

;; CHECK-BIN-NODEBUG:      (func $0 (type $0) (result exnref)
;; CHECK-BIN-NODEBUG-NEXT:  (local $0 exnref)
;; CHECK-BIN-NODEBUG-NEXT:  (local $1 nullexnref)
;; CHECK-BIN-NODEBUG-NEXT:  (if (result exnref)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:   (if (result nullexnref)
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:    (local.get $1)
;; CHECK-BIN-NODEBUG-NEXT:    (ref.null noexn)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:   (local.get $0)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )
