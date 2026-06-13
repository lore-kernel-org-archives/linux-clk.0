Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1149D3C141A
	for <linux-clk@vger.kernel.org>; Sat, 13 Jun 2026 05:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328031; cv=none; b=fADO/2lw5Vphpl/hlMNb6Ea4kvNnbqH4P4H7JJMOCc3vZMRhsbmNMWKkmuKhq9pYaw0B5zxhm4+Z5PYl7yFdv7WnzHSqFYEtDmvGTF3KxZV9Av+Ug5vhOmEy2z+n0nWuzBnb26HMKvXCI3TIIaN7iz2UUkigT4NycXN8fyvwwTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328031; c=relaxed/simple;
	bh=9C+9acoU6g7lVamTfAReYE056+Mo4L19daujFjjLyxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u7JID2OPQpDZyE57sumNqQkb+fPFt9txQdC6aKptzsxhSf/JkWagCxUErWYTI5L9o8SVgeEAgvgqbevbZiKDKteFKl2lSH2p0Lqjz737DH2RQtPYcNJe2ONb7KBC2+HsnEeQmPL5oAUDPNx9DX2ajb+KtoCwaR7vTtvBpdBcClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqkEf2af; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqkEf2af"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59d6e44e5c8so1194427e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 22:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781328028; x=1781932828; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/CLZ+5qQK6nv7unT8PtYK68qrCmHhJFocTHGDo1YqU=;
        b=YqkEf2afuLBjIUD5wNsFTd28l/lznIL2zn4hL5yR7Bwv7KutC7JbiX1AeUjpQtS4Cp
         85G1fE34/Fw9oaoslAIV5u/AtlUVGmsKj2tDuOztf5DP3EAPcBQsAjOwgcd7kAc9MK76
         GQqS+dixjNWGw8TB6R7yuZS50SacBNxwpcFJjT68Hv4DXzwgh/RDjbIipPdR3vVoi6K7
         dqRylJDdUDCEVf6QAIEmjQzrz+8LxHdtsorCofLx53BO9ZOAzv25WZRFrP3gvGayfBkC
         amwcb4NOSBvpFYyzuD/qSewI3KBWg6DThFD6lXPuCMJgaabd6Z8IRqO73I51jwRxZuFz
         /GEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781328028; x=1781932828;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/CLZ+5qQK6nv7unT8PtYK68qrCmHhJFocTHGDo1YqU=;
        b=ZrM6cqs8hsKqhPDqmk3iu4nmhak8DFteKcquC5HK5bi/SifQBk4wLypt2WAIRqAZCq
         3EfvgFKtBVS1Kn5Tvy+DulGR3uVZxIKL/4LuDEC/2gwZ+R7p+CpEwNDuPKUhxSMDlkb2
         kA6ubGJok8tu2QbWCzVzJR9cFZNGJi3fwIOo222/HlAUiVlo6rPGxYE6/sv2zEyzkQ6l
         5KUrNa45aaCCeW6T9bpFvFEsIkVV/2KIJqVVwKyKicNvcx2nfYWcStFoO5ilGEOerR6L
         DyF2ZFQlPP4eIM/tsv/7l8uL2TMkM4I7AyDQchmXVehG5iyhAUbdmNJ+z11SXoWGeEZU
         I1fg==
X-Forwarded-Encrypted: i=1; AFNElJ/7Eu0E91kLlHMsUQTegb6MozNxkGsykisFNNt8CitbCQ0zMUBWjVaoG3G0TARtMi1icuWu3+yyhVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB0krmIQMmuplmpBIwf6MMBQ0beM9zmrt4lfiklQCP5J/iAMgO
	NigIlKeB8mT9t4asdO+s9VVJ5nWB1aJWe2/MW1Mlhwls1HK+txlTT5NMwCGawA==
X-Gm-Gg: Acq92OFhP3+920gHnhblDrqJVnlg7kJXW5uisWCWbhuWHR1HYKswJBnXeAVBMx3uad0
	D5ab4NPlVi0ZdMXVelwCdjzzubJf+YylYrYafddw9KZ1OV+vmzFJgrJrRxw8y31VRzupLkUdVia
	lYKkm4TGpX90UgECwgfmGmJD+QrzXIOvdip7DgCJ6fjCDezdLVJ3r+WfOWYTWm8cwe3Tw655ZeQ
	lsqq4dPHOT57l2ANv+TaOELfdtVRtGh5ihaTDRv36ODmv3kAdzMUCstPtWwzDZW+3pTw3BslhYq
	9MgIrA8i1xfLIMpo0xXihN1erFhO9tLYocDnQYogPPmNa+1cLUJzNC26cUW6tcP9StiGpupam7Z
	oyczM92Cw8mR+kXk+Lfn6L9FJqdRdt+Lc/VCqg8/zHU3j1u6FR+AyY7UL4hMw8/SFCGHxEC6KfA
	5KIj5USNuugTGfsudv7PrfyDJP7VS1
X-Received: by 2002:a05:6122:4204:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-5bb6c001fddmr3552398e0c.6.1781328027844;
        Fri, 12 Jun 2026 22:20:27 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.136])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69014308sm4848692e0c.7.2026.06.12.22.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 22:20:27 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/2] clk: samsung: exynos990: Fix PERIS gate clock
 parents and add TMU_SUB
Date: Sat, 13 Jun 2026 00:19:50 -0500
Message-Id: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHboLGoC/yWMywqDMBAAf0X23IU8IBB/pfSg6dquhxiyKhbx3
 13tcRhmdhCqTAJts0OllYWnrOAeDaRvlz+E/FYGZ1wwwXqk7ZcnidFg0VJw4A1Xh8HG5Dtveh8
 SaFwqqbnHz9efZelHSvN1g+M4AQ8UKgN6AAAA
X-Change-ID: 20260613-exynos990-peris-fix-v2-619c3a30b36c
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781328021; l=954;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=9C+9acoU6g7lVamTfAReYE056+Mo4L19daujFjjLyxE=;
 b=fqNIjsE723ylk8j0/JzkxKuIjpTKFRODde0FklYKkmT158zHx150PVaaryeNmpJCGmx+6lS99
 9PAJFBwCkZ4Bwe267t1dckNnAYv4pOVr4zr1DpoTDCKAEQiCY6X2cEC
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Fix PERIS CMU gate clock parent mismatches and add the missing
TMU_SUB_PCLK clock.

Split into dt-bindings (clock ID) and driver (parent fixes) as
required by checkpatch.

Changes in v2:
  - Split dt-bindings header change into separate patch (1/2)
  - Driver fix now only touches clk-exynos990.c (2/2)
  - Add proper cover letter

v1: TODO-add-lore-link

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (2):
      dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      clk: samsung: exynos990: Fix PERIS gate clock parents

 drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 2 files changed, 15 insertions(+), 10 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260613-exynos990-peris-fix-v2-619c3a30b36c

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>

