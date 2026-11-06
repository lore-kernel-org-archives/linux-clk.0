Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793928587;
	b=t6Rf8npsYLGZU3t0i7LvA8ocy/roTJsi2H8f4lGGZDxZul5AxuEZLYZiyujamtKN141l
	 T32PfGKI4slV75VAoeLSjPg/2VbE4fsHFwdANW7SSoVKd37aQ0Rq/Oxnb6B68OzN+jnsR
	 cKsVn1vCJ3ipRL1BnnolQUm9pFPv3d+KBt+WGvzRbrS/krX8XfUmwt+m/D+TUh3FKAGI6
	 m9gJtaObtxPREbsHd/XsofchTIxdk7FKGG9jEB+UyXX0o+X2LFSodqMv9K9VO5iiyCJ1g
	 vvVCgsQ2Rm/VxAeM8pOp9IV7ACM3jzg6Wr2Kyc6+hbNpzuNtIEe0QQphgzseXf8qpjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928587;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
	b=Xg3p/0vIUQY+iH/BlPrZoe61FhGDRSrdIoA99TaJkNF/mcshYPy6Qhg5L7J/WKYZRwGS
	 mm8AnZQrpBDpnIJfxkQc/CxYApHlwWaJmvgWO94CNKDtbHu3PwI/qIlkZzCGANCu6TFNI
	 7Z/dO2bK9AixHYcJEvWz9X4psqJl43IhrhfmD5jdhbnpsWXNnWWWCwD+jsFNGGVnkQ0ss
	 VG8mcGVksQt/Wy3jHJQw34M2VQNmDlj1YMchUHNK1I916+mz0MDb/lZgeOu039s61cwil
	 rCFPt5Xtg0KFQh4iOIq3Cy1/Y+O0rxvIR4LDXJxkt8sFSsJMl8KHsQBkiInG41HHLPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hoPrTfof;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iho2DIng;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221F606A31B
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 01:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6221F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hoPrTfof;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iho2DIng
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793928586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
	b=hoPrTfofoMsSl7OeMsycpnEnzDm8UuZ6O+VLNIr1lzc5Ho07GhZX07cZpoUnZNMJRwjDe+
	//10HURb7DJP4lvLQzabDPTngZHf+HnpazDIbhmsbpxaz1YAdnbB5hNB3M1xmCCSPo6ZZe
	xtw+CM+CQmVoMcbQM87lHXXaMrORivU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-a7xffn1AMKK3b5s1PMQfYw-1; Thu, 05 Nov 2026 20:29:45 -0500
X-MC-Unique: a7xffn1AMKK3b5s1PMQfYw-1
X-Mimecast-MFC-AGG-ID: a7xffn1AMKK3b5s1PMQfYw_1793928584
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53661e036a2so2184011cf.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 17:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793928584; x=1794533384; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
        b=iho2DIngGNdfMQZh0qNOEMMYiW1V/t002h3uJ7L+4rpamSBPxPBDs4WyVryBdpf57T
         sapTrt2nv2h58mAXaPazBucGKlMz5Rc3RxkRbsLXfqRkFxpOSgZUVGGwv/skn/yv7Sky
         bIaiddr41cDnJLSrnilYKoqSuqDYjvi9hNoL+kQzJGsnHtL9Za0/Eo5rD1q0kBc0HsZD
         Buz6JE8iruHMvymb309lVxbigeHaV6NCxXTUrx5VM0Gkjgkeu6gmJD9rUEUPW9cRRanS
         CDzmrQy194WgzZFsnTc+zRALvS0vRod15krWhRxmorw9YqMq/b2ZYZp7O4WU/bAqxdlS
         cERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793928584; x=1794533384;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
        b=JNLI7lX45YBjWwbNc887w/2h6Od5QYguj1PPBVINGcxEOVvPMdfpOutzDcxSJqTynY
         XTyQWTWXEWYP8ndQSPAkkZ9E3jpfl6yCpl+WRU7vDE8IBQda+yZr0nt0EglPNUpQYAU5
         w0ZQaRBNlC+E1ZhHZZAl6cRafPlze1DDQo8If1FEgCFY8MgtByoKC026CHbEsjeqyeRP
         PtKaAUoi20+7FUkDUdS9j/vrcq8+cqB2nI+Tfc/gl4ENy41/lTpt+j/9EukmICYJi6PH
         IwObzBjFP14RC9qxkt1SMedmvgTqkLDIpJH5oeO9wgEy0R7FTp2QUnmPoPifjmRtFyIC
         KvoA==
X-Forwarded-Encrypted: i=1; AKwUvBxiuarx6Z0FDoFfJ+dMbmVel6g0Xi4MRKWP2Urkr20FEi++di89cgXHm9OxSWAR1UmXtjXtVVLdOXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z894HjhDGvdeESbrnndPeQDKabjJZCxP5PlrK+2tvgqQhB9mA/w
	kCyv/izgOhL9wR29Lh1y9MZkFy8HMNnDuWyLYmFkssFVwNWvrWTnphvTMUCFPvxGVYbXiu9+WXo
	XjJoZqXgxPX0X1J+VO9zVgbouwxr1+bduhM9B3Q83ZLqnv+lyBgFzzPOafvG1sQ==
X-Gm-Gg: AYBFou2kHpDaeD4kvUH5KN1pPJY7DkPtg+8kk+F0Tz+7seSLMDws4OEi0kT9fhBNGzq
	U4TGi+7g9h7YvsbMUvdpl8u7StDiwWhxw7yfk7wdoxmaQQ5DUOwLfPLQRTiyM/HlvuyzvjSKvBb
	+xg8pAJQY6D8PPEu8nXju7K+uxu/ooO3sY0LoZwWmA9ERcFh1wzJkA7UE/EvOnfzLRhA6avQNkD
	G/IjHYGFyKbYw8kWOXb1z2+ho5B/WwolylU87o2xjUJ0WP8Yo+nXddEzjcH0WovAVsnEATij/5G
	+5EEkMyyecT72tEBUOjO2X+nYfiYjgcXgF1e94PeS8tKwqFf7t6DOYya/1wiZDnLoEXUgV09hVh
	Itd2YPg9saCW2cU8YtzFdWv7+xvV89NjKC8Nx7y/97NyVNBh6+36IlWjT06zdkTf1LHmWL49Fg9
	HCZor0WzM5a89LCBKW
X-Received: by 2002:a05:622a:353:b0:536:65fb:fff5 with SMTP id d75a77b69052e-54e1596c231mr17839041cf.60.1793928584390;
        Thu, 05 Nov 2026 17:29:44 -0800 (PST)
X-Received: by 2002:a05:622a:353:b0:536:65fb:fff5 with SMTP id d75a77b69052e-54e1596c231mr17838791cf.60.1793928583742;
        Thu, 05 Nov 2026 17:29:43 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e26f1bd64sm7404091cf.23.2026.11.05.17.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:29:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 05 Nov 2026 20:29:27 -0500
Subject: [PATCH] clk: samsung: exynos3250: convert to
 subsys_platform_driver_probe()
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-clk-subsys-v1-1-993c474e7860@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDXRCsFVxKLawSBIByHi7orll
 7z3X8DoCBmK4AKHOzHNk4cMAzCdnloUZL1BRSqVMkqEGQfBW80nC6tsbrM4zoxW4A+Lw4aOL1Z
 Wv/2yR7O+BbjvB+zBcuhuAAAA
X-Change-ID: 20261105-clk-subsys-d2d9d8338ca2
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7ycUhYaTHTijLETgf34xYgBmPS7y03e26r0FoL8ptEI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe6jZ+3Syw76dB9vH8aLXHwRdfqzR/tl6m6Wv57V/1l
 RJ3E63fHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExEbhLD/8o5AYtijIRnM2W+
 PCXU0K3huJuJv/u/k9WpNfMleSa9lWD4X3E+quGxUEJjlMKOTBshycnPN5t21InbX/0a7XMrtPY
 aHwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/samsung/clk-exynos3250.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 32d12658e1a9..bf36d2f2a3f8 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -1093,10 +1093,6 @@ static struct platform_driver exynos3250_cmu_isp_driver __initdata = {
 	},
 };
 
-static int __init exynos3250_cmu_platform_init(void)
-{
-	return platform_driver_probe(&exynos3250_cmu_isp_driver,
-					exynos3250_cmu_isp_probe);
-}
-subsys_initcall(exynos3250_cmu_platform_init);
+subsys_platform_driver_probe(exynos3250_cmu_isp_driver,
+			     exynos3250_cmu_isp_probe);
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-clk-subsys-d2d9d8338ca2

Best regards,
--  
Brian Masney <bmasney@redhat.com>

