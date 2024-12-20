Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA741C07C6
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690351; cv=none; b=b2fTP2S6edfxgsoirqOTg9MHHB2v7o81pGPSMc9DM4LBhn2KaGnBq1ea/oBb3weDCKsWrc6IkLkv3oJII5vdLO+PmTc4ULp3S2qV2XTIIzpvca87GqCjnaeXBaGYow1D8/vj72IcKPcV+cP3cQKkJFalBmV6q8kHabpN4YHsDlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690351; c=relaxed/simple;
	bh=Pxn7QMrh2zuVgh1mpm3H2Yh7TIOIErliMvP1+xrWdOU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g+IMDgrQ+XVW2/mGGn/knjo6Houjm2h2VBNxOHgtIicIjZUdtDsb40d6a8mfEMIoohZ9pGxyTLx8DXcvmJxtoXeTfqSh/DVzlUpwgqgCL7gIaCU7bporxC+z4/1DZIab9CajdZ/8OmOhW26Vo33LFook49AHUwWSJVr8qVlkUCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JrGd/jOE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JrGd/jOE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43621d27adeso11874455e9.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 02:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734690347; x=1735295147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ArM8tPrv2uh4KdQHEvgTbozMB6b4jdDuY+KtgYWF/fI=;
        b=JrGd/jOEPIGlgMoUndbAbUfMLtjX2SUQkdYHNelignq8Gs/jWfRwVTK4XPztm3w9n3
         0hAWtLvIlNV4Tr7n0SPoLqezTGzdWNLPZBtfm9hO1KZxAgtQMjAdkPIWkJOrZ7L1gam6
         pOlVD0+9BBIKpTK3E8PrHIZzT6c6NYHDXdkP9X/n/3UuyRkLMM2dIbJU3wi2Oe+0Bo3U
         QoQt5LFoej0AhPe4OtTb+u9dIHVkCMVVAk7AEIKexoSItzkai3Tn05zYGIQcOUjaQJKz
         Pz4Hmw8xshVF2vp2Q402Z121W5wkrW8W2viGWcGYSnqxSCkVT+bA3Ck/4Udr+3NUJ1WG
         b/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690347; x=1735295147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArM8tPrv2uh4KdQHEvgTbozMB6b4jdDuY+KtgYWF/fI=;
        b=TfWJmtiCKZMMQC30BbCJS3kw9K6CyeozhPqo+0LUOkqcoplkbLjdHkylO7MnQz2KKE
         YxjP6BCn+noI0q0Uc4zvVxvTr7+/kwS7XgkE9EGhorTdxHDbkU6qVj+O36LmK4m7uzAy
         kcKd3G2+GoMlXq74nXwWi0CzumS7MFbNew1b9nb8LB9QeAwWDsmcdnn+k1PV4qdtJPSc
         ClhqdKEOvubtEEaCUzUGoNBDKHycbn/LQmmB9TRVPKzuhy9a8G3xVCnK9f8f2ochMjjA
         9tmXhYNCu6ofa+zVrtkaaDTWdbYEZcx+8w6ZKQ6VjOIuE13A3HKAb1Q781r9QBlk9lXq
         FLBA==
X-Forwarded-Encrypted: i=1; AJvYcCWlIqBxQ6NAqpNYqvRFBI/7Kl5ouyWzh2s/NH9zYphFwpOYDSMCaYbWXqU5DXhVkeXzWElZ4zxNO/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR6Jc5hibMQbHXBBYEgR8J+goorB+Enwr3INinhOAkVe5SpVc6
	ngM6qZ0nCTcbpSJUcQysuEw57DdOK4pcWI0dEtdTuKndYib27aJ0OBi16M4wt+Y=
X-Gm-Gg: ASbGnctOx5Qe/+b/pcIPYjUEyQpC2OfAcZmKcXHYL9cxFGsQMcjmbhWmP6B+1Shh82+
	tiEprCzjy1gNVl00rL8bVH+AzkV2WioPGKrWPtkaXcBYpyb9eThxc8sM1WIAGO0PmwlzGvaImWu
	dC4RHBBJYAeTDeoEK6nMirBquXaTzrsISpfR45zi+SBG8u50haZAxesXrPh6gGHvRZ+SygwI8yq
	m6Ad8nzjvVtaEwKH3SNvqvRm+GRId/aHNKbV3YJ8RLC2P0lr7Dd+Vo8ASm/lIDQOyfLzb0=
X-Google-Smtp-Source: AGHT+IGeDU6I3JVYEfSem+J2xV0n2Yi6xG+7TAsB45iwjjwGCMNga20LBdZ8QfC+b384/f/a7wLSjA==
X-Received: by 2002:a5d:6d07:0:b0:385:edb7:69ba with SMTP id ffacd0b85a97d-38a221f2dd7mr2392065f8f.1.1734690346496;
        Fri, 20 Dec 2024 02:25:46 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2b0sm3752071f8f.82.2024.12.20.02.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 02:25:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] clk: amlogic: gxbb: 32k clock fixes
Date: Fri, 20 Dec 2024 11:25:35 +0100
Message-Id: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB9GZWcC/x2MWwqAIBAArxL73UKtBtlVoo+0zZbsgUIE0d2TP
 odh5oHEUThBVzwQ+ZIkx56hLgtwy7h7RpkyA1Wka6IKxy0cXhy6sKK/rUVFK85yc0KjW2Vt08y
 tNpAHZ+Rf5L4f3vcDFiBzjmwAAAA=
X-Change-ID: 20241220-amlogic-clk-gxbb-32k-fixes-9483bb55f849
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=613; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Pxn7QMrh2zuVgh1mpm3H2Yh7TIOIErliMvP1+xrWdOU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZUYmb2J+gSyLdTpK/sPBj8t4x//U4xeaezkCp
 /ZLXARVyCuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2VGJgAKCRDm/A8cN/La
 hSLdD/9Kgjb7cIL/hb3jwTRyvjkgd/W7LkpK8NCMvuA85C3F+hQDQeMyrQZWvvJfR+4N/DNpT1j
 tRqAZHv5pHo1vqPdKxn7CbLquoFZmaAqyjFrmb7sWcOtTCTMHsopVtVEcxaGcvgRN9GiOR+t7l/
 MDIKskgOhs6OKDvMTv2UHir6XvHDpJxHXk+YoX4WhWVyhVMzRUUBOUHWp17LoXP2CJhpKcWOrca
 ViNaFH+oI1syRkM+3RMuVySnyMlrKQOUD9qvxKRzOdDUv5JdiVvciHZ1Fal0Bs7j97e14Kt8fwv
 T76UZtZ5CTTJ41IJdQ5LhgeEdnyp/x+Pnf+118AWQAonf2igoJTG/jUI1je1A/YDBo0d04Wza7P
 co6KEJhWARwtybHrTt5oxVLHRMJYjpAA53M409YhVvngU00gdN+e5YHCtxmIWKCb/04ncE1/QRs
 dOLjHfqDlIlx32dBdovOqcvbroEJ1PQHpTMry9Q53W1o1Q8fyq6Fl2exWuTab45qr0NGQMrdIqh
 yr2XdHkcUxK4Z/4gvNUExaNbYjOuz69JY7nGuq70m2Cbt1CzS133ift2Is9BcDXPQkeDZ1jxf7S
 5+fRqOMkdInSvmY/12eomvPJL6MO7wOdV7GzbmcWg5qwpi/dZyTzbM+eATC0qwN1hGTffyr73FC
 yTDuQaEp4JqosAw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset provides 2 fixes for 32k clock of the gxbb SoC family.
The problems were minor enough to have no real world consequences but still
need fixing.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      clk: amlogic: gxbb: drop incorrect flag on 32k clock
      clk: amlogic: gxbb: drop non existing 32k clock parent

 drivers/clk/meson/gxbb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-gxbb-32k-fixes-9483bb55f849

Best regards,
-- 
Jerome

