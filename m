Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF11A14F70
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778439681; cv=none; b=uewqASLQ8L/9pjF9rxCN/8c8eGmQ7DfYYmE/8sVAJ1hv4vcD9ZXv5JV4ijoPNi6Qz8JivXqn7oXQeLrJWdHwWPSbaZ/c8WhQWEqvWQEJIx2REz5ECx5LYbbRcq6+dQftTW8DFFvkGGZ82vAagCAKCsh++8kivyTdzP0YnZaApCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778439681; c=relaxed/simple;
	bh=kT6u3aN0CxM1ye+M92QBMG9z2Lg5tOb/LLbLIToLikA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c/vU1Z+CoQfbNu7//s3EiVin7piMe4XLnY2UQvOVglidU7i4xfketuqYfLVkCYFwCECzqoA3QeIiOnJPzSRnKUtJ0hsgXt/63Yn/H7yPc605xSmFKQ8DwS4bMVPnQx9iogtyX/UbtNlSI7a0zp0qRCuj4dZBX8CwiIYW7JFJNgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYtcIKHL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYtcIKHL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so38741185e9.2
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 12:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778439678; x=1779044478; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BVTiXVZ5+SQnfIHWp/DmlViAPIxX5n2kT347/Og8OE=;
        b=VYtcIKHLDboKB5pkqySwIRmT5ZMVDgUckLC9imKsiPGJDIuAjx8CRLdjWW3L9W2PUa
         ytROsC8OuErTXEgej12Ez1RpG3DHlEo7bahnCS/RP8Ap//DqV80A2OD3/p9FRgBH+FdJ
         9VQBgParoqXD/p0cYCjjCrh40SDNrNwyc+55G6wWO2UMJeglohd36SKiGgR9EPgklB8d
         vApydUUkQ54PXfuobRjAPNKkZGhCwYyHdBI9MJoCscMHVb7qj1DUlHEqST3Knk/ZtXx8
         D4+yQUMlxRFj4ZE4ntGckpeHJf2/Ak3bVkAjr7DLOp3f7q3ohHdLmMg2X9rqZrLYowNT
         7Kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778439678; x=1779044478;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BVTiXVZ5+SQnfIHWp/DmlViAPIxX5n2kT347/Og8OE=;
        b=E9if21GCGDYfRK2h+zAKFdRUxwHDewdaqDvJhf/B5J7o+SWnUkJdfU2jdTwMSzd7dS
         CqlgSDNfIqHvHjSHTMxUUX2Lu3BUAwmtJ4qp1JY86Vxvba5elEV1W4enogaNSTKvQ4kb
         kXEkZJwTxoEEwFxWy6z9fbtkzb0JtK2LYakG/BU2uwtb7Ym4wQPodBsLInnXWQNvcj+V
         Nl5q2rRPZS8ZtzO5vnzT2g6pQ7B5r4sbZGkL9KjAuFTEscnSuA7Yveq+QIDyrDPVt8t/
         LEv7Rusppi6oJj+cmPdSFyEgXCeGXB+m8Q48cjE/AWPvpqCYmlcPvaLD8NPViM9wlxQV
         rifA==
X-Gm-Message-State: AOJu0YwQj8BB2vvoeK5eXbzpBZTL+CZgxb2NaV7B32JLGP43wlIu5rev
	HnmgDfiCWzZ/F9olvRyvh9THl1JE6A9Ma1xyMPoe2T3Y87Fpl6+X1XH8
X-Gm-Gg: Acq92OG/cKy0J2RkFTuxVom0MVPyDvN5NVw5ZzCr6HSFf5EXJzRKxuQON0FMzi7YN+y
	wPnXsyTn6VC2ferGz8Cp2++uoq7kETXkuUWXVodBZMoQwvr4+fjT/mtSo/ShPxCFaisFdsiOqNh
	XAwSOFrAv42cRGhvti7KpAyQ+NQPzGd7EzZ3GpGe6ncJ51aGm+nDn9hFRUMfpw5cQQVpgI4dn+7
	WuLaxTCi23l7QIoSojXKTNyYVlBY9zh3K0h6HjVyvQbejJ3pJKIzHGx/q2uQmCyKlwjXN1frZXz
	NfnaE2TPUCShFRjI3rEqhcNyFdI59Si8Cfo0cPZ4ChRZk4toPNyshHPgmIHUd7aPUycLM/US2Pe
	7BcvQWebvIxrnEGv5Pi5bHNXUdKo1lsfKsGVP0DtYYFNbYRnXhrg54jMJ7bSqFfHnU3gTNDKmIb
	Pl7nrZSb96ao6NewXBapVj9dVU0o13PLFK3f4giwuyYudI
X-Received: by 2002:a05:600c:c0c1:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-48e51e1ddb2mr251916185e9.11.1778439678005;
        Sun, 10 May 2026 12:01:18 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm132877475e9.5.2026.05.10.12.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:01:17 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH RFC 0/4] ZTE zx297520v3 clock bindings and driver
Date: Sun, 10 May 2026 22:00:59 +0300
Message-Id: <20260510-zx29clk-v1-0-e1bacfffe967@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOvVAGoC/02OwQ6CMBBEf4Xs2SbtUkqXq4kf4NVwwLJoo4BSJ
 ETCv9ugB49vZjIzCwQePAcokgUGnnzwfRdB7RJw16q7sPB1ZECJRmZKiveM5O43gazrlDhVaB3
 E9GPgxs9b0wmOhz2UX3Hg5yu2jj/nXAUWrm9bPxaJRMsNOTJMRlEeJ6zNnWwkoUZtckKyVcUW/
 t8UyfZFKyMCd7XInLQsKePMUTFZKNf1AyLqqGzWAAAA
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6050;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=kT6u3aN0CxM1ye+M92QBMG9z2Lg5tOb/LLbLIToLikA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqANX0P2Cl0r21M/q2o+jb2oqnhUr26Ym8VJ0PX
 vomztuGrO2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagDV9BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiL7Nw//U1IzbqmoeXjG9hGU9ky9SmjDA9FA1Ek
 NFpZOnGJFuhqkYiAGk4LTw4t7AYjuoZxrbC0C0qAF1naNE3TP8/VVXXtxYi694vx4E00K42X1OL
 8ejx/e478Noh6K1a+axlesPesRDDQKUriJ9p5Ot7SV5sXBOatJQaALfxLOe7yzFCN3tWZLNjGni
 8l4EIFO2/gle9ftAPISUBcFjafQ+Of31dcbC5H4ivhZNwCp/ihrf5OdVzbzokH1uQQf36Pk28Qb
 yRtbHKLWjnE8eDahjoNhd1gL3hZPtA0zuux4/XuDuzbZkyNS4D0j286YII6kjhCRg6d260Soo9C
 M4UaZY60DylOO+GDysDWdKtiodxfS2trIxrHi0h3Ucdxac0/Vmu90FGRAumZgOCcIseuz/ThP2l
 qwGwA4EQ2nhUlelGz5W5AuvIuj+/11JdHKlO512ZFhvzuj7H8Ku+2/0yHZfa14T0rOY/928uzma
 /AxzuQpPuRkWpHnrMkOCXd9hZGIheq9zR1Eua0adKGWEXxztiTxUwRi0u5walRsUOuZ6YJanqxN
 +Wd4Mzygm3ucPYA0+vh7Dlwnbk1wqOYY9PyOzXbd0zF0ipd7s95k2KHZLsODFa8c4DNcTuhBjLz
 Ty2sTHqPoDnbSPoTq0dLcfwPH9I6iRkRvlN0NrxJy15uJDxUazng=
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
 drivers/clk/zte/clk-zx297520v3.c                   | 980 +++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 179 ++++
 7 files changed, 1354 insertions(+)
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

