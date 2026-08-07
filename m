Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CDE393DE0
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113057; cv=none; b=XwxBqZ/jZp1ctt6vnqTtD61mQiVQuDbSprF4ptV48Omj9A57rm4QeUjCHVGtjFFKk7kz3Q5Fs/YnzbpnbplbFX7m21cbO92O7x1fBBriVSuOL2zqU49IKnD7lKzV0IGbJsvR2fKnbnO+0BIumwK4U5TFgKvs2f+OdE29wJIFPxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113057; c=relaxed/simple;
	bh=42FOOuneJjjjqdBfd3B8oLn4rYaokjTvr466SV9Lpw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LFC6cqumfJxgH6O34ufiJhV6ljsq5DrIJzNRRFwYQN8rrUIhK1jAv1PuOry8GmtosSqwolSk/hDrXykuwOtM3XMcbJl/o5tq5f2TrBqriXVwdOm2970KeeZOKR1NU9uFRZS72C5e9rrGeMp13dnVEghFB/hzGnVhqpaCbObgu+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YY6PV+Ni; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mGQhMJcu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YY6PV+Ni";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mGQhMJcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786113055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v/E+/rYg8OTFryDIeMfy+TSLjFr+LPCVm5YT7tskFQw=;
	b=YY6PV+NiCrRQ2wahQgugsaBoxwn+qJFToNDLZ/YDBi2I7pY+9yBT5Jbpt8JqKHXafF2w8j
	uzF8vVRw+YAVxHP0q7+9JYz4Ck1CXlqHrXY/hyvPaM6uMKCyYxY9LEY34UaP1zdkvX4Zgj
	GA9QwyWU1O13HrFWvR9GVSvucNOwbKA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-2V-izMZaNBuKLbr1QbgpAw-1; Fri, 07 Aug 2026 10:30:53 -0400
X-MC-Unique: 2V-izMZaNBuKLbr1QbgpAw-1
X-Mimecast-MFC-AGG-ID: 2V-izMZaNBuKLbr1QbgpAw_1786113053
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81f3d9fac73so62915067b3.1
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 07:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786113053; x=1786717853; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v/E+/rYg8OTFryDIeMfy+TSLjFr+LPCVm5YT7tskFQw=;
        b=mGQhMJcuSfhKy9ishJJ4FEk3EC49mqevQkGTG8jK7oSb5X1LFwZaK2iiZe3i33xJez
         NY44WTWCcaE5l/6LVz+nb9x4K/HIUKf8cul6/FEO0rfSbwM+luNhNrAc/szv+KlM2djE
         hOaN11WW60H8VVKw8haZlAb/EpYfAfBvgHkDwJ+tC6YlAR2tu8DIIqEGo4N8PKXfHSmH
         mmbUiOzP+N/DqD/k+EXV1CFHh9UpPfkstlYFE5I7FEjFBWoGoZX0fb7Tq6nI3SpstP3X
         Y3lvNGWOXdbNXyf3OGrVOZDbjWtPq/rPqxANK7sNaeHCl9e/nu9yDdT0vIzOno3Q7F+d
         zOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113053; x=1786717853;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v/E+/rYg8OTFryDIeMfy+TSLjFr+LPCVm5YT7tskFQw=;
        b=i4e27Fi1MfUU4AfruJ+0L/ZCYEmaM98AjT1FmC4X8P+KNOWoksG7YAV1fnj7osljE7
         YXdCcYshyaBFP9S/sbut/pgU7LP2qEZktyzSkIugTZQ5Jo9plHtKYvj5Hd68tUC56rOt
         RQi0rdblMfZTwKihfyWFq319Mv7myv4IxD9XQEcfQMx3UYwCzN2AAwsM70FFmbxSU54K
         stS4/LaPiqbsDlgmsYoOoBe+KUtKVDxT/HDu1mvvDDgzjFvpWCGSb77NNmLs/hT2hu6p
         k6QgNLqK8MkKziau+/PuE1xAdhQJHTz99HxGrm4eTuayhtHz+4PBDUW2yXz1DIU6y0XB
         fdQQ==
X-Gm-Message-State: AOJu0YwidHWemeMUblbztNOCxaOcm+44u9XcoKF/p80hgeyfsg6dqg+3
	Cdx+yCGvTVKtNgQ7svvkxNYw7IrRqCsts65J5l/lWdidlkxZerT8yPAaYzyMkfijZFVirXNW2yr
	VpgooOpTDE4bdu0RNf0d9dmU8yDzvYt6sify+7aso6LW2q2WEDjivEfuys+b+AQ==
X-Gm-Gg: AR+sD11+LwVMYM7xDB6Bi1Vw3lXZMULQuYIVeNrIkXzhEjStlzDFrF+GSCfaVjEbRsu
	pmLvHB1CETsGTr03MwjIvxu0umpDxc4iVCUXbnIGcXXkA0T8HLID+dtmMsYIsxE0g6KC5c8J5NB
	jUntRbfYeTx6yyzldYip/PZb6u/J+vPlFEH/yulFIVzEeazgXFVBkpopdozS6OJAzA4zQuBW8yi
	W6jK9ayocJ73j6EEYWGV0UccNEY7Vgwwpa2bhxAw8Fqa01ExDCemGd9AKOXgmUQ8V4v45cAkugo
	5gwmcyzH+HabIPdl/Gngm7RO/h/MExxkHZ/pawx/KEtkjIQcs1eQqi3f8LY95a135xyFcisrD1Z
	4KTDVTyKdu7MLHa6WhGyhqRHxxfOl63uA5yYxpMJl
X-Received: by 2002:a05:690c:3389:b0:823:3c47:ed67 with SMTP id 00721157ae682-82595c22c9dmr2250497b3.6.1786113052848;
        Fri, 07 Aug 2026 07:30:52 -0700 (PDT)
X-Received: by 2002:a05:690c:3389:b0:823:3c47:ed67 with SMTP id 00721157ae682-82595c22c9dmr2249667b3.6.1786113052360;
        Fri, 07 Aug 2026 07:30:52 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823efbfa7f0sm10323067b3.8.2026.08.07.07.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:30:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 07 Aug 2026 10:30:34 -0400
Subject: [PATCH v2] MAINTAINERS: Add Brian Masney and Jerome Brunet as
 co-maintainers for clk subsystem
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-clk-masney-maintainer-v2-1-c6d86245cf95@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WP0Q6CMAxFf4Xs2ZJtTGA8+R/GhwlVFmBoN4nG+
 O8W/AAf2uY26T23bxGRPEbRZG9BuPjo58BC7zLR9i5cEXzHWmipS1lLA+04wORiwBcPHxIXElR
 nUxjr5EVKI/j2Rnjxz833eGLd+5hmem2YRa3bf46LAgUd7m2hauusUwfCrncpb+dJnD4/BuH9w
 ZHTDyQmjNFtkfmD1b7SVmlVGpkXNXdZgobHMCIThsOAFHDMZ7quic8uIrD35FOTLVWugVrFoM8
 XDSFfySMBAAA=
X-Change-ID: 20260804-clk-masney-maintainer-7b4349a0f004
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=42FOOuneJjjjqdBfd3B8oLn4rYaokjTvr466SV9Lpw0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJK34iapjF3M/96ZLq4s5Drc1J0tmM5y49zYu49eiam4
 hODJt/tKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCJhSgx/OC7xPUzS/qfF9TEt
 Nz/9hnnYor2/inveJXq/3hZwpCbJmJHh2oOdHKv+Oy5KvT3T3OApz925u7RvBnYLmUjPjnJ7/G0
 NFwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

With Michael Turquette stepping down as a clk co-maintainer, this
subsystem is big enough that it needs multiple people to keep the
clk community healthy. Add Brian and Jerome as co-maintainers.

Link: https://lore.kernel.org/linux-clk/anW-jTldkWSJK3wl@redhat.com/T/#m0ae01b8dd23c452d82f34b61844a8305977a53a4
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Also add Jerome as co-maintainer based on discussion in v1
- Link to v1: https://lore.kernel.org/r/20260804-clk-masney-maintainer-v1-1-de593189a9a1@redhat.com
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 07ffdec1c8c7..2c3c80e4761e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6448,7 +6448,8 @@ F:	include/uapi/linux/comedi.h
 
 COMMON CLK FRAMEWORK
 M:	Stephen Boyd <sboyd@kernel.org>
-R:	Brian Masney <bmasney@redhat.com>
+M:	Brian Masney <bmasney+clk@redhat.com>
+M:	Jerome Brunet <jbrunet@baylibre.com>
 L:	linux-clk@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/linux-clk/list/

---
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20260804-clk-masney-maintainer-7b4349a0f004
prerequisite-message-id: 20260729121640.3864006-2-ukleinek@kernel.org
prerequisite-patch-id: dc8bae434144f43dd5ec1355d22ef9be3c34c9e9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

