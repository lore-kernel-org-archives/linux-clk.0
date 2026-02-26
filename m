Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AE53D413D
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129874; cv=none; b=t7QFqql9AdaFuPn2+pqbIK0RB5hPvX5V0CYBsDNiDIjd3O22IEmKBwFLE+qMkV1Tj8GeHvr6zymKJubJ7Lyjgw7c2gpn9GPcqeXHQp9P+VxLr8fp5R3BpD0tYOoDkcMELo8Y/8jVeCKNXPwJQykuPvg99H/GQAtOEjWx0jfaqUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129874; c=relaxed/simple;
	bh=PqSklRGTT84RCWTv8f9JLE1XbRsMxULGrhWguX7B6Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilSGm7UH0XKAuLBcF41mRIsRpXWVvIs/JQX8gl0YMJX2Ai+NhBgtpIYkd0nRU8u54aeVLnomgFjmB3oRB1TtsHmV7/6sGJTXF+bagQd5pIPQiZNutI3erIm/mgBjdoPQggcTZRkwIZk85oSw6PVlmkIkGshoUd9yeJJN1N9VoHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J7QAO55h; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xx97iANF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J7QAO55h";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xx97iANF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ICerqxT6PiHLSzT+CXe47/5xuDjrqEf5wuAa6aHlrSk=;
	b=J7QAO55hdhlTMol2VGKOq9rl/nD3MgWH65Pel8EkksgI/Dr8py7N9gnFsD6oJkF+s+lEIp
	usRQIJt+ke4lXeNToTOCfv/CbszwBkmxT4F9CawexSkCRehSymqXxqqvx86DyeHHSRfSzd
	0K4R/Q+uVYAYosurdU+/mS02yo7EjOE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-os5AXpsNNcG_u_v92KdPYg-1; Thu, 26 Feb 2026 13:17:51 -0500
X-MC-Unique: os5AXpsNNcG_u_v92KdPYg-1
X-Mimecast-MFC-AGG-ID: os5AXpsNNcG_u_v92KdPYg_1772129870
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3fae6f60so1378349485a.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129870; x=1772734670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICerqxT6PiHLSzT+CXe47/5xuDjrqEf5wuAa6aHlrSk=;
        b=Xx97iANFHoU1Gn6UddlCDsrfxFd+xFdl1R9GJF4EIUWBi7NsgKFaxDRBu5pY22pCvn
         AMlS6SnRL3ANpusAiRQjHTT/k4Z+5QC9yi44s7Ii93UYUoed4TFpFU8pYyJqk+0LembZ
         Yg53LCvaFkU8L2CNrJXIYGgIld/hGdbTIodtjUY2xSAtx6trv1cWeESgdE4Mt3/J3SaK
         /PT1RJOCF3Ipmip/6FdILJ+MB9DBQEKPdRjHU/wA3ZEx2rswYybynOgsLHp3PI33jPKM
         uM0+lB9PuCVKlSma5UxHJF/1wNYd93KJ6bkjyLa98Tz7und/3TGqDTKBoJur+pvx0Qzx
         2SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129870; x=1772734670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ICerqxT6PiHLSzT+CXe47/5xuDjrqEf5wuAa6aHlrSk=;
        b=hE4qZf4MT7X4D6Rq77CydnA5/hlf9b0iI40EdBXqxqYSdSG5Gvpsm40w3HAb2K8yBL
         3BlW678NjTt+9I6lwtX5aNUJNh0J5U3MZWHKUwD0nlDv/VYL0a7Z+ApMVgwGbEXHubyh
         H/0k3Nhhmu/jPCbeuNkMcCQAw0dJKMdyL+HZHpKAYvDMuzAx562PhoH+2ITvndE0T9Zp
         dhCPpUjXN34FVqdhqXeak2jgU2dFIy3t02XcJ6jtzCqu5YYs4cuEpt49k1QtgljHpG+l
         hurkwXh/extlV0gk2dq66+BtLbGTIPsrEgmMI4RRWhUUp39bsY3WoV9sfeijVHPmsA+v
         6Z7A==
X-Gm-Message-State: AOJu0Yy59HbNVoAtk+r3DnA/EaFtCt1IrOj13tFt+FfQsx0TB20Om76m
	1rpohBSGjjDp88BIEOaJNziG1FjAr5F3P8BF7z6v5wjPmf7WkPiq3ojZHozay89bUH5u4nDTiMt
	ardOn/C+6O7gfnfK8tcs88MFDfVHjOvTYpoCvOnCuZJ61LQa6l6sDHpM7hQTgWQ==
X-Gm-Gg: ATEYQzwU5m++xBSjoM4gg+OcEeAZgf4g+zGP3KuxM3Sz5fKE06ZGizykMWQdROPBSof
	k/zmodBFlycmBmqR8gDKlD+gthNmbq2T+QwNWbI4/n9cSYl/ehL1B5ZTd4qRfgjUp3vg6+ol+wr
	J3McNput2wDXBqT9Evk9wiVSgCfafk3tOAscJ5BR4heIZiOvgizPlScy1cJlrDVpN1ooMB4qWRl
	EJ4z8vUU3ruu4pQ+VThf1sndFA3sBxXMf+9K8STOigSKpjy3RB6nncZ6HGJMM+FU7aChbgmrN0k
	rT3ckW9VLHtwHqFNQGULZjK6J0lVsTHtNnoe6oqfY1sK7yF92oPfK5Gqayk9VxofQIdwZp4pQsj
	7dJ5IssbTdi4LzVjk0WmFfDlQOZfmuGUIJPIwg32K4bWXcCEdAd+JQ/toLyVu
X-Received: by 2002:a05:620a:22f:b0:8cb:bae9:9f59 with SMTP id af79cd13be357-8cbbf3bdffdmr413048185a.30.1772129870499;
        Thu, 26 Feb 2026 10:17:50 -0800 (PST)
X-Received: by 2002:a05:620a:22f:b0:8cb:bae9:9f59 with SMTP id af79cd13be357-8cbbf3bdffdmr413044585a.30.1772129870053;
        Thu, 26 Feb 2026 10:17:50 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:48 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:49 -0500
Subject: [PATCH 05/13] clk: hisilicon: hi3660-stub: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-5-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=PqSklRGTT84RCWTv8f9JLE1XbRsMxULGrhWguX7B6Cs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Ok9qNozYbelzubgG7Zntj1eYtH8Uq7+2UPLqj8Pb
 z/d9/bf545SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAmMucgw3+3XTvUHiq7c101
 ePX09hvDlZ2J0gcneT1N3VR+pkY02i6Y4a+kGr/FkvMvZ7z37P4m///UC5ekQ9oXuuYoKKqeflC
 5OosHAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/hisilicon/clk-hi3660-stub.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index 7c8b00ee60195e94f3b414bbf79ee5ec3cbf6c79..839660d26b08b6301ac909ebcaab56f569cdaff2 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -32,7 +32,8 @@
 			.name = #_name,				\
 			.ops = &hi3660_stub_clk_ops,		\
 			.num_parents = 0,			\
-			.flags = CLK_GET_RATE_NOCACHE,		\
+			.flags = CLK_GET_RATE_NOCACHE |		\
+				 CLK_ROUNDING_FW_MANAGED,	\
 		},						\
 	}
 
@@ -67,16 +68,6 @@ static unsigned long hi3660_stub_clk_recalc_rate(struct clk_hw *hw,
 	return stub_clk->rate;
 }
 
-static int hi3660_stub_clk_determine_rate(struct clk_hw *hw,
-					  struct clk_rate_request *req)
-{
-	/*
-	 * LPM3 handles rate rounding so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static int hi3660_stub_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -97,7 +88,6 @@ static int hi3660_stub_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops hi3660_stub_clk_ops = {
 	.recalc_rate    = hi3660_stub_clk_recalc_rate,
-	.determine_rate = hi3660_stub_clk_determine_rate,
 	.set_rate       = hi3660_stub_clk_set_rate,
 };
 

-- 
2.53.0

