Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2563B6BF9
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 16:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786724889; cv=none; b=r0Em5KhritxDt41QdUPJBVa8cKB39UvevfBR1L3vraZssMxMwp1ASSYugzdMet78mRNKRPWJM9swmE1+l2gC5M+Y8GesCr1bLVw6J5rz8FRLI/0I005A1SYbTJKsuhWbZ96U2DGmSxR6ppQ8c5WR4ix4QnezoRf7bQHFo/Pf7JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786724889; c=relaxed/simple;
	bh=WcYW7YY3eP/L8Ych38cMsTxN4ExIWrqxqknrK5FB3pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rb5mJHy1MGm5hvY94Ap31Yr9rqY1hznA3YzHogct1POHaMG4H/Aylh0l6DvVuq8/3AVFEP9KBFGT4DEve8fdNNdQZ4l1ZoNw3gOu6K4EorjCyjyG7HWySypBPhCnQ7/gqw+ymBX3RO3FLqvUiDDoxFSrC1pLT0JBTI+uZyrrb54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gRJK6rT5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gRJK6rT5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so9001545e9.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 09:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786724885; x=1787329685; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VvvWZAI2n/cH3PA3j9X+pFa+lBhhOzclmhLuSgZQqqc=;
        b=gRJK6rT5uN1C3z5++wdOR00jyATKjApUHOzoQVgZGZNRs2aQ3736LfWIwTOQpgYUnb
         QqKjhZgB/Jigg7+JfnzytWWNNRy7X0PhrubP8n2eAuMPvAkfl3h3Cbn/Ums9UxyzdNkT
         0t6MWZ7H3cFx5a5kRYeKTXou+0516E6AzC32/WZCITqfoXSpbLuFPYF7fuwGn+WavlFq
         tEAKAqifMQ7PiYlDO4aH/KizdjLWOm1QH3y9Fb7dNH014feQXkR7+GEeTSj9YiTx02Pi
         pSgKAsLlq6h/7rNVa7586BaQ21rLQZYll8uXMlWaL8b6ZtJD0PXAQNqfWbPqahUwLriu
         RA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786724885; x=1787329685;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VvvWZAI2n/cH3PA3j9X+pFa+lBhhOzclmhLuSgZQqqc=;
        b=oMHauQzRZes1PIzW3xvqbFTkBTPxwAsIoi8zAIf9RRlcUANv1CU5MT2I1qIz5LTRDD
         4nv/2f1KAgKowqa/jQ+cVVFCe3QLDHRvPYNLqgMRkfPn9zK/6zLo/MrNiI4XFQSGm5Cm
         TM9XQcpBnhONHXRVjTuqoEoLVWZn7JKIsAUuYplyuOGOqHiRiMiGidCH7/Dkn7603V6O
         vAgrOY0FH4hIwPUBih/kMhzdx9IsN+aar9LodDb2hzuLwvCiQKIY5TBhwavxshP9YbVb
         CeAx5l9Ih7uDCB9rvdWwphUkjFsdJ1aBWFj1y0OWsL6yKDevwrymRVhnbbMPcmokjxUD
         PvZg==
X-Forwarded-Encrypted: i=1; AHgh+RocQNZfkda4rv3txWHJXIzPmMtSpTWpAdwBzAbPQh/Rz4sjmwRjxnnPE86xWRpxq8/pnpGVmziSuuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+X4O99kcDUAHXvt7UXyd2HSRq0Z/zO5MJUGX0PwTQ1n1LPEt
	r6Wha1MsapKgKoPDTEE93nbcMbs9zLnO9mMEwjne2bwYfvor32RdB8zkXHxM5/hOvi0=
X-Gm-Gg: AR+sD11WHYf9/pCnBOz4zNfnnKJgcFSicPkwsM9flQnygnvd0f2TzpYeYZ1+kE0f3/m
	LPnibWgp4UzrUxmUMpaS0LuN6A69QaHxRocksolAsCqlibB0TldgxrknwYhbOx7DET/lQXknbMS
	3abMNU7Dd3XXxMkVSfkX0FiFo92H2pnY3C0rSv4XcV880c0BKNFtO5wnB/0hY4DbaaAPfwjACto
	MmxiwwZKCPy5XRDDR9xYLLeHZPVjzEc70B3yVVUFgQwW+0oaGsE6jNORgSChwnv3ZkaqtEP98Jf
	8cqoCBwCZx1oDllC2I6jbCmdlQDSi5VjQM4tq6BkG8JJSKB+B3RPqv0fTGFlsKZPiE5V+Qnzca2
	D1zfqg74cABYhAhqSQBlRv86Y0dYV9YT7KBF7WKOLGPdUpT/dGOE7lL0wT8TyvbMF9A4rNsI2NY
	UYVB4ehiLgdZUibU7Hg87VchvQpWIscLGeRsYD5ny048c0hLSqvyZcFLi+ZYE=
X-Received: by 2002:a05:600c:a45:b0:499:48be:3189 with SMTP id 5b1f17b1804b1-499878ccebcmr88526065e9.0.1786724884736;
        Fri, 14 Aug 2026 09:28:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49988b25625sm65357715e9.13.2026.08.14.09.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:28:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 14 Aug 2026 18:27:49 +0200
Subject: [PATCH v3] MAINTAINERS: Add Brian Masney and Jerome Brunet as
 co-maintainers for clk subsystem
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-clk-next-v3-1-6f7f1410e809@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAARCf2oC/y2NXQ6DIBAGr2J4Lgbwj5qm6T0aHxBXS1FsAY2J8
 e5F7csmk8y3syIHVoFDZbQiC7NyajQBkkuE5EuYDrBqAiNGWE44TbHsNTaweMyBtSSrBW94hoL
 +sdCq5Xj1rE52U/0G6ff937DwnULDnxqqhQMsx2FQvozmImbYSrqrAzgnjngZ3Y52wa6U0Twlc
 cLDJTlmeNI9KAP6ocEa6OPRdndUbdsPMwADctYAAAA=
X-Change-ID: 20260814-clk-next-8e2f05ba8d85
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=z8Y1oo2h0pBy0HruJJQQru63TW8nkZOLeG44Ih0khqw=;
 b=kA0DAAoB5vwPHDfy2oUByyZiAGp/QhHIioFsYKFrlrhcmfayYZlVyIuB99cnEoC+7W6TqQO+L
 IkCMwQAAQoAHRYhBPThWa4Y8/VtXxu3G+b8Dxw38tqFBQJqf0IRAAoJEOb8Dxw38tqFSsoP/3hg
 s43ZSttRQJW+IoiDAKhpaYwjNNnONEosOOCzbrwka9NYuu9tiF2xnP03gy1O9B+pTmxndSjbsFV
 DSMeenBcBFn31UoswyuhT7pfap0qbVge3umJ9qby7ERdU2aoPdC2ldy6TYEzhWAa1lAB2tNYuNd
 uas7fr2/uUM0ls9Ms8gUWYjO39+T6vajz6mVrlNfkXVAzokEc2n4XEQiPK1YfmLZuFpv8WGV+Fg
 pMK1FY/DqlUBGr2qYhB5l4hjIgofFDzwMgUFIKSzmYoBErlBjlvP33XLtXbmLrEF9exhXJkXMPr
 s9IUxlhts4eKUcz1ydd02esW0WFq6esbjW3/R3BULNuDTmHI2wiIhah23szSjMTZ8l73pE/lhGy
 m1o7M6P1opZpa7Q6tW67ka6+BKu0f/6oVPNekCNr0Z0BwxEjzNHk1t3p0sz3YqaDvuT8umld5yA
 +F4QQVAMluYEuehnH1p9eiNdUEDg3TNBJ2RDYMlpDQoB3M3znx8gpTj46SHUwMAOynfGVpSJzCF
 uRpmzlB7WJNC//5CBRDoIUWJnIjTZaYn3+nOuko2uYeJ4k4WDIzuQqTrinqrf5A8RxDCiCE3XC5
 VRGO2WcB9aRt7p/3i3/tsM/ontmOu2ewiZl3PzKCBNQHMlMYhqRkadcqCDfMjSttc3LOFMNVO9k
 y/10+
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Brian Masney <bmasney@redhat.com>

With Michael Turquette stepping down as a clk co-maintainer, this
subsystem is big enough that it needs multiple people to keep the
clk community healthy. Add Brian and Jerome as co-maintainers.

Link: https://lore.kernel.org/linux-clk/anW-jTldkWSJK3wl@redhat.com/T/#m0ae01b8dd23c452d82f34b61844a8305977a53a4
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Changes in v3:
- Update Jerome's address
- Link to v2: https://lore.kernel.org/r/20260807-clk-masney-maintainer-v2-1-c6d86245cf95@redhat.com

Changes in v2:
- Also add Jerome as co-maintainer based on discussion in v1
- Link to v1: https://lore.kernel.org/r/20260804-clk-masney-maintainer-v1-1-de593189a9a1@redhat.com
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 520d79aacf2f..c682fa6225a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6448,7 +6448,8 @@ F:	include/uapi/linux/comedi.h
 
 COMMON CLK FRAMEWORK
 M:	Stephen Boyd <sboyd@kernel.org>
-R:	Brian Masney <bmasney@redhat.com>
+M:	Brian Masney <bmasney+clk@redhat.com>
+M:	Jerome Brunet <jbrunet+clk@baylibre.com>
 L:	linux-clk@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/linux-clk/list/

---
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20260814-clk-next-8e2f05ba8d85
prerequisite-message-id: <20260729121640.3864006-2-ukleinek@kernel.org>
prerequisite-patch-id: dc8bae434144f43dd5ec1355d22ef9be3c34c9e9

Best regards,
--  
Jerome

