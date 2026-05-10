Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F7833E360
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 21:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778449817; cv=none; b=GwjC5/P70+4aZPhsolwcIczBSE0yUcGxsQvc3fivUKtitT6a9IomS2GR9+Op8nYZvzx9ynG2celxrrCfjMcH7PGiTtfr+/GBDASoGJbtrsU14ff+PaueCvEdAer6+CwrcUIUuK3GNhDoorT2DSq3JMutK97YSnsZ2ewCZKpqYMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778449817; c=relaxed/simple;
	bh=1FWRdxxj5EkkiW8Bzu9Z55H51s/qWHn5uGee9b2Xx2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RvXBIqP2tZxw5bJcSUB+g3sfSIhuf5yR3xHrFnAqA9dI8RWAi8WoNsGf/9wbX01oFPUFjvxsldHg1jqaY0RrNzrt9IogwBQ4neZBjTZu4S1hshBFXvjupMgUZmvyY7f/l4KVjUa2ND1zcIOyxB/9ZbgIclLO5T0ohbkbUVfubhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqMqG68x; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqMqG68x"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0046078so30001475e9.1
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 14:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778449814; x=1779054614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bgny92PjKz0ciw6uJXBm9sdULwA5xSc+14yKTBbXsAw=;
        b=VqMqG68x1ljpHrzBc46NVGLNEg1fw2ZXytLSincuB1DvMdO/jjPddgt1jsQGkb8uoZ
         wo+/3BDQINIM/j3sqBLi7gclq5w1eDgRnMImH1NrI2yMzjMJlUCvF/3/PLKxk8qk/Ic2
         YTN9gvrZ3EsGaVRlxBMGjifvTnDaEMydX7z2ULKVNLw3FP3vWvBcTbxnxKax8AZX2qGf
         PSLUy6SlEMJgloVoDcE8jEMAYO/tHPEfFw/oAKc0VfuUuOipOVB437ch2knQPjmod8VX
         +mBF3KubwbzaJsizJbNa6DY1/rNcr8Z8VqiLThKHTf8ZMnvoDzoQwewTs/Ag8wlemDT1
         x1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778449814; x=1779054614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgny92PjKz0ciw6uJXBm9sdULwA5xSc+14yKTBbXsAw=;
        b=GYzWNv+LCXkrOCRu6GQ4wNEUYVlHxt6kE9hZU5FB9ubKbdYNphwkECZfuAO0LmPdy0
         2AYSjd5SWNYxUJUFitAj6SA3tMbNvbyuQbdHPh03X1U5n1CLjjWJ17Nndyw62f0fYx0u
         2hArgdKQVLG4UAswgqpBpIcWejBfoM44Vv6j6u1FNRWcIhFGCEOQlWqhu+6rcbHq5C8f
         AMTw99m94h07rRIlgWIahZk8rcwr2sfsqMwAgtua6F5hmIZW1zS81jWiLfHu0HN7ZRkw
         M0y6hxlb8U/xdaAsAj61FT97HKHYa0wNXjZtYwhRBcB4ro39IQagFUq8fCWFGAfdVBco
         gF6w==
X-Gm-Message-State: AOJu0YwaNKsuduL+/yPeLD9BVFwnRd4aJpTvLiQefNiNFabgg1Su6GmA
	PoZCZqoCnRUAe/5xOoGgRvWjXEHgpg3amD39SnIFDSVVDPEGzHAXx4TG
X-Gm-Gg: Acq92OHlxajPTPPakVb3o2CEPkzm4UqURoH3JDbwcTQFs3KN84xTxm5Nt5gIJDZRNiA
	zfyh9YdXuRsRiks6y+BbDnqeohAFmz3H5XwtzpsHXZynVLnUv49WokZIChXx7Zv0jQBMc3b8Mzs
	dVOx970fR1y5n4Lc8XZW0quDN/E31/Hl2/dnyGZAHBPzH+kk2y/a/ESxZD18LLVd48nfTyKRF9t
	h3aefXfMxCOVqsQ6bZ082RJfO9PtZSUDIr+RILefb202Tgnl8i4UpA4Yt/1DwtBoqio0WQEV5rd
	VnOzo9Ue4J12XJH+MZcMPujgqq+az+nqAJV7yCXqf0ncecXXC/8weMpiS7WrRA7RPNhxL1OpeqX
	tfte2/aPM2a7FQkyNWvD+owB3HPfgVp+8cfctOw8E5iwvgRJG2pIrJCfDLoaTPcW44UU2BvvUbL
	aOQRl5+msl2jup9tuUBvgc8kMERnJsSh0=
X-Received: by 2002:a05:600c:8214:b0:48a:6268:18a9 with SMTP id 5b1f17b1804b1-48e706b262amr118344505e9.13.1778449813627;
        Sun, 10 May 2026 14:50:13 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a68ebsm19207317f8f.1.2026.05.10.14.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 14:50:13 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH RFC v2 0/4] ZTE zx297520v3 clock bindings and driver
Date: Mon, 11 May 2026 00:49:49 +0300
Message-Id: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH39AGoC/2WPwU7DMBBEfyXaM0b2NnG8OSEh8QFcUQ/uZt1ab
 RKwQ1So8u+YwAGJ4+yOZt7cIEuKkqGrbpBkiTlOYxF4VwGf/HgUFfuiATVa3RitPq9IfDkrlLr
 fkewMOobifk0S4nVLeoHnp0fY/xyTvL2X1Pn3c/BZFE/DEOeu0ugkEJMVsobaUuFcyzpowhpr2
 xKS814c/KUpcN8stbEqy9irhrUTTY00TN3itt5TzPOUPrZVi9mK/w1YjNJKzMFzCKEAtA/Hwcf
 LfYGD/bquXxHKc3YbAQAA
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6143;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=1FWRdxxj5EkkiW8Bzu9Z55H51s/qWHn5uGee9b2Xx2c=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqAP2LO6zq143X34D49mIHvB2n8/l+8qRp6Bq0d
 QisnVR28WaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagD9ixsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLOyQ/9HJkFs1lOpprF2B6lWwN1tJWXbrjxYAF
 UAPJOD0dGj/AVV6L7iOJtsYdIWrmzrt7WbdprfDGwI6LG1IsqBNLFs4vgLjLOpBfGZnXqAcStqA
 L1yXpNeYz1IMP+TOb3JlrfCvI4gPpcfTXyy/ZJ4bUgSCOBHJuOaklBWLtREK/Psy5xDGZ2bZIx3
 cQuhpVcMjw9k7D9MEqMFpmywWN6IDwLzPNjFdRrRIW2hAo1McpFPORY1o1Wk4HyN3QOUjKuDskI
 1I600N1qZtCAKLo5VkfZNkJ4aCZ0xGvNf0OIZySy8ErOKXbfghbfflocxBKVwfGvF4r6/5QLKO8
 y6I/1Ao0ny7TVEtV8WHQRNEp5jkd6ug9Aahig/CcBvX59QsV9+cWPoKkP9lm6GVpxymN2D6aO2Y
 VTe8RNamll4p5cFBk3Gm8n2226YOhrGy3WQpjDXHlS45hj/bN06EC0PpPwKODIpafriYJiNY/qE
 aSA8lZqGsVrQwTo2nyU8YGoAQO784rscLM+faW7+qpXhPW7KuUhGIroCDTvLBtUD4QOn8ZTp3UE
 /1KoqOFp9g6hmDJb7MsFtCGjcAyl+gE63MnXzg4NITp02fv7Diw2j9reJaP7UjCq/LXjADt1LM0
 u6cEaScKBYK84pVp7dtwakq6dxDqoEZEH2P27PAHr0xgAWDWO5vI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending my clk driver for zx297520v3 boards for comment. The patch
series sits on top of my previously sent patches for very basic support
for this board [0]. The first caveat is that b4 dependencies don't seem
to do what I expected, so I have backed out the MAINTAINERS and DTSI
changes from this RFC submission. It should still be good enough to
review the actual clock driver and bindings.

I have pretty good understanding of the clock hardware, but a number of 
questions about the prefered way of implementing such a driver. Either 
the clock framework and its documentation are constantly evolving or I 
am just bad at discovering things:

1) The clock controls on this board consist of 3 controllers that I 
called - following ZTE's nomenclature - top, matrix and LSP. The top 
controller is fed by two oscillators and generates other frequencies 
with PLLs. I have expressed this in the device tree: The clk driver 
binding requires these two clocks.

The matrix controller feeds 10 clocks to the LSP controller and can turn 
them on and off on a per-clock bases. The DT bindings express this as 
well - the LSP binding expects those 10 clock handles.

There are no explicit HW controls for the top->matrix link, but the 
muxes and gates in the matrix controller use the PLL outputs as parents. 
I have not expressed that in the binding as it would require 25 or so 
clock handles. Instead, the matrix driver quietly expects the right 
parent clock names to be registered by the top driver. (OTOH having 60 
or so clock parameters didn't stop st,stm32mp21-rcc)

The entire LSP part (I guess the name stands for low speed peripherals) 
looks like it might be reused on different baords. The top and matrix 
part are very interdependent.

2) The clk-reset interaction: Both clocks and resets are in the same IO 
space, sometimes in the same registers. I see a number of clk drivers 
that register a reset control. I noticed Yu-Chun Lin's RTD1625 clock 
submission added an aux device and placed the reset code in 
drivers/reset instead. Is there a preference for either way or any 
guideline of which way to use in which circumstances?

3) Unused clocks: I looked at recently introduced clk drivers 
(mediatek,mt8196-clock.h, sun55i-a523-mcu-ccu.h) and they do add all a 
lot of clocks that do not have an active consumer - which in a way means 
unused ABI. Please let me know if you prefer to add clocks one by one as 
their consumers are added.

That said, there are a lot of clocks that I want to define for the sole 
purpose of shutting them off. The boot loader leaves pretty much every 
device enabled, including proprietary timers that I don't even plan to 
write a driver for. Registering their clocks in the kernel will allow 
the kernel to shut them off, so they aren't entirely unused.

4) I took some naming from the old zx2967 code. In particular, each 
device has two clocks: "WCLK" for the device operation and "PCLK" for 
register access. Are there more standard names for them? Likewise I took 
some device names from ZTE's downstream sources and I am open to better 
suggestions.

5) I took care to test unbinding and rebinding my clock driver to the 
hardware. It works at least as no clock consumers are defined. It seems 
mutually exclusive though with declaring static initialization data as 
__initdata, as it will be gone after the first time the driver is bound. 
I also don't see how unbinding and rebinding will be tested later on 
when core peripherals are clock consumers.

6) Clock name string matching vs passing pointers: A presentation by
Chen-Yu Tsai from 2024 [1] gave me the impression that the kernel is
trying to move away from building the clock tree with string matching. I 
see APIs for passing a struct clk_hw * as parent instead of strings, but 
that makes it more difficult to build static initialization tables. I 
think the static tables make the code a lot easier to read and I prefer 
that over boot time performance.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
clocks is not an issue, but removing or reordering them is an ABI break.

0: https://lore.kernel.org/linux-arm-kernel/20260506-send-v8-0-f1bdf3243b34@gmail.com/
1: https://www.youtube.com/watch?v=d1VIAnVb3hI

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (4):
      dt-bindings: clk: zte: Add zx297520v3 clock and reset bindings.
      clk: zte: Introduce a driver for zx297520v3 top clocks and resets.
      clk: zte: Introduce a driver for zx297520v3 matrix clocks and resets.
      clk: zte: Introduce a driver for zx297520v3 LSP clocks and resets.

 .../bindings/clock/zte,zx297520v3-clk.yaml         | 173 ++++
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/zte/Kconfig                            |  18 +
 drivers/clk/zte/Makefile                           |   2 +
 drivers/clk/zte/clk-zx297520v3.c                   | 979 +++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 179 ++++
 7 files changed, 1353 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260510-zx29clk-2e4d39e3128c
prerequisite-change-id: 20260416-send-5c08e095e5c9:v8
prerequisite-patch-id: 94a9b9f889829e5c1899cb1be89b7ee9899b2626
prerequisite-patch-id: 8a849ffe79ba35ef560250fb38587487cc5009fb
prerequisite-patch-id: ef282d0a261dc1097f05057cd43e9e75ae52d92b
prerequisite-patch-id: 5d615c9f855fca6da461168f45a5670a3c3cde81
prerequisite-patch-id: 980a7e66a1031cdcc244a5e461220d68c72309a5
prerequisite-patch-id: 45b6fc60cee81a793cd69e704bf098f1a68769a9

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

