Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57263FC5C5
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491595; cv=none; b=jpp9mbBTQSCnA8c0Qwl7/03FtAMT95j/mQiw2qHvgwjJFFv5OfxmrzeRwMsRmT+Ds+aPkhPUiAGZboZG0vEuBETh/vhKEd9AHwH4xdXj4NADBIwHmpezxW1QDXIqe0pR5PF+Hm3BclblWesTjgv7kHpmFahncagoQUWZYUFEGvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491595; c=relaxed/simple;
	bh=bg9znAoidL3T3xPeKitW5n5yYJtb4QN2AQr+a8OWug4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tcd1kNr/gOZmJV3nbAIxaIjoTUVjgwSJzCDpJyT0EUU0ExziW4ufydobKc2O8IIQLBWooGwWlJZM6N0jDm0wAiYj1z54/w/RUIH+j2dP2WKrgUfyedhWtcNFVkA4eHHUkMuERJQIzHO6IIn5tTv1BgcnX5wJdItmygetBcRFAqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yv6VIaR+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qEeSu9lR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yv6VIaR+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qEeSu9lR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z6k9bAlUN3GR2gspqeApZc0R2eNHUyrDASVXA4THBoQ=;
	b=Yv6VIaR+PWiqOmUOdFjONj5bYK+YGF9e9a0rCZcpFUM2276YiZkOSiUjriARGuiWkTou9G
	2rzj0Kj1K/hDT+gndgW/+EwYZt1UAj1FIEdL5L3738r19tMw1sIozoGpJEinUptGyuQ0o1
	FFViNMbxNZixIYJE3MTiVfZB8Tou/hc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-0EGFQlpsO5al2lz72qLubg-1; Fri, 26 Jun 2026 12:33:11 -0400
X-MC-Unique: 0EGFQlpsO5al2lz72qLubg-1
X-Mimecast-MFC-AGG-ID: 0EGFQlpsO5al2lz72qLubg_1782491591
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a0d024b84so11651351cf.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491591; x=1783096391; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z6k9bAlUN3GR2gspqeApZc0R2eNHUyrDASVXA4THBoQ=;
        b=qEeSu9lRysxSg1rEn644VxZ6L0N4CCtozku8kYsYwH9j2GgaC/5t7rrw4STxgpWwul
         gAFVQRPCtdtogRuPcs/4w8rjO1rWebQ8phQCBk8tLhT/dT1FmzluEdtzaxQZ+bf+YWIs
         1CuQ7jkH5KYBGLJtGauI5NVaAfTjUHhMYrFzGyS/lp0dolwk2THhZCrM78gpVdDJR3rE
         ntYfuMQ12NE/mwBVhkx3EAF8yz0/npSCSvsS2OwrApxdW9JyRnVVVwKitR0kwgHwf/fZ
         h2jlPItHMz0GL+wCb9KbUyB75RSQVcSbVe/gk1U+kqv/X/ziN+jNQhRzJRhbhws9Ck8b
         xbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491591; x=1783096391;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6k9bAlUN3GR2gspqeApZc0R2eNHUyrDASVXA4THBoQ=;
        b=H04xaFCcsgNyp9Ro4GJDbIQYkwvQGSmyhJVoNqNdlD3mnEWueXP3sbilrfRz5CGhgP
         0S6NgkOQ7EOJb5tkb4k1VBDnW3kHvyrTrTok7NW0o2o9CBu1DWWZ/9XIFDaozCX4eXeW
         e0tyX7tuDzvwYKHiMxlTPKI+/2MshQTYDjy24OypC0gbfbyzAOW7icy7/yawR7HbfW+T
         Jpoh/ojO+GymolxjzFnEmxYVjXgGXWp5Nr+Nun1IhLdu1+EuwEaAOvlbL+kbblOBIlrf
         zLzLkktyoIhTV6Rqc/7+S+0PA1FjY6hl7A3wmCZBRlOUlULySir/t+aWrXkhJFl6g7xT
         pNFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ut2msR+13rhgrYrY7ZsoO2l9I99to9GUvgE/WChgo4mOadYI2zcJWSpxN/scG2+nmorzBpNCGGDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwErKtA29VMRBlihSFhbeJ8ORnkOBvj7ME1jTe6Mmrt9DFbIdPg
	hgMH4/v+lVCM8Nzu2YR1gOWpoUzrBx5lLbkw9oFgsqz6OO87F5Rz6k9CiSvj1D5uEFRB2kr4hnN
	8Y8xVf1gR4d3tJ72N1eqm4lLofsC4/cHkZhlB0PVP2KTOMEkmOpOGVV/oMFmIng==
X-Gm-Gg: AfdE7cka2It+V0mSuOWj066RrP/HcFhB8/fi17E+xXVAfR42v0jDoIEEb530FajYuX1
	qjHH/6Arj/v3x7f8aHX0AE/tMoiBR7mxJ6QFIXq7UyeM+kHQ7qYw29zCdQChpoLV7C/3yxTYnOK
	OJ+ani5J7Qi0x+RbYHOGcAj7kiLdf1FyN4M1+szNkdMQ3XH8D30Fziov6xLPAmGTagbRYJ4wZCL
	CATdF5P/gzRCcgXV/CjIviki27V9YB5e2O49o/Edds9MbDU146c88hfw9TAoSw7/m9s1GY3cjD1
	nfsP2vQyyzuQ7OBAPbeAxP0K3rN7i/7R8LvqijjmNqyj03KthT9QzBu9OmDCrqERMUs666CmDpH
	WV+Xcx8IiH5NwGrrhlbKOEzFbemK7uKsk23j4HfvAdClcieY4aA==
X-Received: by 2002:ac8:7f4e:0:b0:51a:8c99:1f18 with SMTP id d75a77b69052e-51a8c99223emr11336491cf.71.1782491590629;
        Fri, 26 Jun 2026 09:33:10 -0700 (PDT)
X-Received: by 2002:ac8:7f4e:0:b0:51a:8c99:1f18 with SMTP id d75a77b69052e-51a8c99223emr11335551cf.71.1782491589761;
        Fri, 26 Jun 2026 09:33:09 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/4] clk: implement sync_state support
Date: Fri, 26 Jun 2026 12:32:41 -0400
Message-Id: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswF2JdJVqITTUUFo5EId49a
 fkW/2cQikwCQ5Mh0s3CZ6jo2gb85sJKyHM1aKWNMtqgP3aUN3iU5BKhm5WyVvfO2B5qdEVa+Pm
 H41TKBwBFMJpgAAAA
X-Change-ID: 20260626-clk-sync-state-ad008829a689
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bg9znAoidL3T3xPeKitW5n5yYJtb4QN2AQr+a8OWug4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVu6/yxxZGNTU+anKb0WYEWPKq4NtjJltB6tM1De8c
 b0WaqDTUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwESuTGL4H21R2rlfI/2AfmT9
 1uaZAaufLI771ptpemXTtf0m3HEHjBkZlrppH/+y8Pxd1QULVANm6ta93pfv4WKf26rasPMGu1s
 qAwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The existing support for disabling unused clks runs in the late initcall
stage, and it has been known for a long time that this is broken since
it runs too early in the boot up process. It doesn't work for kernel
modules, and it also doesn't work if all of the consumers haven't fully
probed yet. Folks have long recommended to boot certain platforms with
clk_ignore_unused to work around issues with disabling unused clks.

This series fixes this by adding support for sync_state to the clk
subsystem.

Changes in v3:
- Allow multiple sync_state callbacks in the driver core via a new
  helper dev_add_sync_state(). This allows dropping changes to the QC
  drivers that already have a sync_state callback since everything can
  coexist without changes. This also makes it so that this can coexist
  with the pmdomain subsystem.
- Only show "clk: Not disabling unused clocks" message once.
- Add Tested-by from Neil and Xuyang
- Link to v2: https://lore.kernel.org/linux-clk/20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com/

Changes in v2:
- Split out clk-cbf-8996.c into it's own patch, and don't call
  qcom_cc_sync_state().
- Clarify comment above call to dev_set_drv_sync_state() about
  the -EBUSY.
- Added Tested-by from Jens
- Link to v1: https://lore.kernel.org/r/20260603-clk-sync-state-v1-0-457120eed200@redhat.com

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      driver: core: introduce dev_add_sync_state()
      pmdomain: core: migrate to dev_add_sync_state()
      driver: core: remove dev_set_drv_sync_state()
      clk: implement sync_state support

 drivers/base/base.h     |  7 +++++
 drivers/base/core.c     | 29 ++++++++++++++++++
 drivers/clk/clk.c       | 78 ++++++++++++++++++++++++++++++++++++++++---------
 drivers/pmdomain/core.c |  4 +--
 include/linux/clk.h     | 14 +++++++++
 include/linux/device.h  | 21 +++++++------
 6 files changed, 127 insertions(+), 26 deletions(-)
---
base-commit: 6c94b38b83a04c43ea49004275f0391404051093
change-id: 20260626-clk-sync-state-ad008829a689

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

