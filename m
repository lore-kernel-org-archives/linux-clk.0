Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262C331AA94
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 19:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196454; cv=none; b=q/2TlodsLK9CMpfZBbJ8RSfSIL/F1cAPVSqoi+3XGk+D3RpnwmCFJ2/VztxT7kO95yLEReZfXUyeRaUGfIWqx9iFU6Xp9FEslmJSoo1g0RjAis4ln01oqoQQMcZ3TmhUmtrqYmZ1rLV6l3s8i0OyI8DMU2dt/zLQcxPJ5mKbbAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196454; c=relaxed/simple;
	bh=IgAUVLkWwqGO2mMDNWtelHzJGhNm0ve9N5v+4BIqgVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UPn3rA0avKUKYgBZrHJ+ZUuWW2C/bB4hnVFVQVdbaqOBEZSGmY5BKgpEcnohBE1dIkTWlcKZkaJEJg/lh7WrSiWcMp9ozX8XBIRFMq1UG9VBF/yAF1ZSIQknbdwhlzMCdQpg4oqvCq+5RpzkLTt9/wS/a7hM7pkBVjKLsC+9p5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9Df6XDI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9Df6XDI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so4182299f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196451; x=1776801251; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVJW3ICHXX4TVqiCnHxTqaSjyOw0BNMp+syjTFufF9E=;
        b=C9Df6XDI5t2LG70YlWVWHShcVMu6SwATtHT8taAgOJD4ExEPXpbQFfBBqLPeN1stev
         QjMft2raDecqiKATo6LvHdfxOu8H1ojrFgtng/kXR2hHoAvERHQ3zFSD/g5h+i2tJgIh
         JDFPwlm8sVbiCo9Wm+t1gDSQ3IWBdo3QSWy6J0syTvAZdFSpNPJ9RSKDTqDhHDmZUOjo
         aTegnwkNxU0pjQTAaFa4f6TWZ6It67syoOkfJ2byIkJR01OGhkGyceDSVyI66TT3LIxr
         LmhNXdPjd053aHZlfjBMLPxt1FMDBLIk5goFM/CjXUWBOXQzIEy7qE20SZSPh/NftrAk
         dpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196451; x=1776801251;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVJW3ICHXX4TVqiCnHxTqaSjyOw0BNMp+syjTFufF9E=;
        b=N3MFOBcx9YC7V/oW63OCvCfS3RbQq9ePes7ckMZdLysLdR89NHSdQ3FiWpJippDLf8
         246EuFMFHMHb9rLnSOjl7RUmXuoPlFGHcB1He89MF3yvyLeV4K+XsuPF1mbrT/m6hPYW
         Ys14lZ6iMj8T5Vc69O/VIw0wfqgjh4bcVRFFRU4JRyUBwa4YS5Z8VQ4q7X5pYIdeFirZ
         0oU4etfHIWz3T9BYeR2euOyY9QBWqdeqhrHJNdhKKu6d/2aZnPPUU0azwXWw75DsTk89
         /ohF1QjRchTV+7p8SV3mg+SN2dpp0CfGYrtPNcT4nh2H2ccMbPrpFGXJFvKSJy8zYN+o
         BJGw==
X-Forwarded-Encrypted: i=1; AFNElJ8jl1Y82Yvzvlxp1QfiTM+aaWZwhAC+xwakIJFoPjAsk3rDIo9Me5psmZvkylFtN11OWvP7xAZ1KLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zkQS59eF/+3WqwMClvW2g5kWYtO5B+ziN1W7/PSR5Tvk48nL
	VvR20WbhqeSYwo7CzQ277wF5JazbR7nxOO0kBHVd3GVyo+Pp/h+a3Wef
X-Gm-Gg: AeBDietU8rc+oH67hOmyb182d4vQaAxx+9hVFNYAAiYr9b9kLO2fgo7sAhnu2I/VI0f
	ZQboJuUDBuHyo6u59/j7F4FyF+Cek5YbGDX/j5+I5dOI608GVlp5gy9a9CSOrELpoa3moFz1v/R
	elFbywWtdiojAKlQrUmDdYoiX72HKdwWNmvd/2/vOpV2AXf9dJUKnAvpKXaNipUbN0D1mum94Q7
	D1sjB/mMwBnaeKGsUASI+wrAD7onu5s6GfVwYxJ0sgc4SKdepKoBZwaGN5e2LEuOokIo7QjqNR0
	97s9gr6h9TjZNYUkXjmW1shtsa8XbxAR3UAYaI5fy5luR9YW+d06oilgV4fRfRgGGc+Sauol5fg
	A6SDP6vZcCNtIM4KsoRmlShC7NmURBB26lnHfuhY7cFZSlC6fcjkXVeKXHTAFe5l8WO9bacLLRm
	1SwY9Xo5qlKRzaH6BzbUiAMyPSxymLmM111DExaN0g0fz460UAy9p9KZosnbSP7/oxcLaaypiM9
	AtmTEDkxTZLuWrGFc6pke0=
X-Received: by 2002:a05:6000:2013:b0:43d:6fb7:fee2 with SMTP id ffacd0b85a97d-43d6fb80156mr17543282f8f.45.1776196451390;
        Tue, 14 Apr 2026 12:54:11 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:10 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH 0/4] PXA1908 clock controller resets
Date: Tue, 14 Apr 2026 21:51:49 +0200
Message-Id: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5DQBCA4VeROZtkZ20oryI9sEZN2yA7KhLx7
 pYev8P/76AchBWqZIfAq6hMYwSlCfihGV+M0kWDNTY3jhzOW0OleaD/fjCw8oJUlD7rqcstOYj
 dHLiX7X7Wz7/1177ZL9cIjuMEIf1BIXUAAAA=
X-Change-ID: 20260414-pxa1908-clk-reset-179c3f1d6214
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=IgAUVLkWwqGO2mMDNWtelHzJGhNm0ve9N5v+4BIqgVs=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU6UyrT506i1zu0tp6LJzs5Vp3U3qK48HCC4UO3JW
 fmXrmFbOkpZGMS4GGTFFFmYl8pd4ksNn+hQZJsEM4eVCWQIAxenAExkximG/+6O+04/zXz0402V
 Cn9GtUzGi22LHW9fjRNQlphn4PY24SQjw4qWc1VWy2auDbbLdX7Kqs3Dwmr5e73C9QPfdmRmfLk
 rxgMA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

Hello,

This series adds the resets found on Marvell PXA1908's APBC and APBCP
clock controllers.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (4):
      dt-bindings: clock: marvell,pxa1908: Add #reset-cells
      clk: mmp: pxa1908-apbc: Add reset cells
      clk: mmp: pxa1908-apbcp: Add reset cells
      arm64: dts: marvell: mmp: pxa1908: Add reset cells

 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 34 +++++++++----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       | 14 ++++++
 drivers/clk/mmp/clk-pxa1908-apbc.c                 | 58 ++++++++++++++++------
 drivers/clk/mmp/clk-pxa1908-apbcp.c                | 31 ++++++++++--
 4 files changed, 110 insertions(+), 27 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260414-pxa1908-clk-reset-179c3f1d6214

Best regards,
--  
Duje Mihanović <duje@dujemihanovic.xyz>

