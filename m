Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB973E7BAA
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786742488; cv=none; b=kA+iCafTfUe3IB7xYTo7wRO6Bq22x0CcripnGCA3x0yX5eDs4UIm34rM44IvdlghYhglhO3j2niIk1wwY7bhsEYlnNZOoFskUcBb0yTgfQZJ0ISk4ab++H42T6aHNqYMwFEP+PCf81pSc3c6RoROY0LvJRqnUAmueWi1kkZeoko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786742488; c=relaxed/simple;
	bh=aeFKwEjKKufKQNi0yFU/UNw9tD/Mo8eyvfULfQC1wmg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sHp5quzFSgxo0PB/LXJ9WGg2+njD02vPedvzTZCEKeahuOs23AueiBGePAsAxDfLT5RymbGAjr321/R6UFIIhpbzoouhHfaM8MZCPV4qYz5v/QuTYdnbonWfcnX9zz7QoeACPR/QiL2brXr/ck1UCENOBFaNtSp27iDKw3zNwt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGkXEJ2x; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGkXEJ2x"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-384caf7b168so235466a91.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786742484; x=1787347284; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DVu0lhxCQUxAKVc0SIc4QIjOmrv7bizkEMfzDep33OQ=;
        b=TGkXEJ2xXtmBXVuAP6mroJxzd0ru7EEej/YqOQIQkVBxATv66A5LOpEOEsYGujp0ZP
         WTBw4l/2nnbvEaOu6qTAf2SL6J5Q5STE0esGr5sMr9YH8qYOL5C8iIBEM6kzS274rm96
         UuMcoZplhbOl0uicNLy5/muSep8Ne/5Vby554GTH+ywqv1DEoERqeB/23zxEUlnOpAVp
         mxKOEB9VvIFRkzdDIhinMehWAs3H5PzTEDXgWb6KhqUsaRDIJyu2XqiPF3Bomb6ePCcc
         X6pD4ALAtvIxlXYfIytMCEfqpGq4Xujfw4nPTw5jtb/283beJ2nhk+gKNl2KqrRku0AR
         2aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786742484; x=1787347284;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DVu0lhxCQUxAKVc0SIc4QIjOmrv7bizkEMfzDep33OQ=;
        b=DP7Nf1HTfzE+VdBPbu3oCyNl8Ua3LpTiIyx+d01g00r8dySRWT05coliCw8fTfV5gk
         MLUDygWgegptKGlQQ5C9+ipcjphLmfVe4hIG/Khqh4cCRX6oqj+UKu3My/XSmyPs/fWL
         fFEFb9QKNJyByBSvnoPjX9kUYdGYCpXITBPLaLJ5vm3OBUXnooJ7IYLc46XarFNmbRPi
         900JC2T0bUiY9C0vNLTnUTVdJL5DuX6kfToofASTd6iUwPOdGj/QyI+e/y8nntCPCERC
         9JowIFs+MV34DgF1hsR1Lqy5Ga4UguLiHEA5ad2AVMuq9qKV3/O42wXodEgYDRv0tTWo
         sfHQ==
X-Gm-Message-State: AOJu0Yyog6VsMyfvXW9FS1017cYxNnrj0zn3PRIY0S1dOD4iTgx7dY1D
	/xABULWmIT21Mck5r6vxjOp2T7fiwWBYFK+L+HUz8VA89R+ywm0cXtNq
X-Gm-Gg: AR+sD10OlBafn8D7a0Ph0/ZvFdGv4nqRqy3RQD4EV0z5xoWVyoJgJAmwQjdMfHY3eNM
	4LMTc6L1l9Rx9n/q3gyCaJKnUS7FiNUsYdqrh6K7+4/6UPYFGZ0egPEfMWQry7CEha+v4bbw6gP
	qGVtoBUiidjpU1gMvknJUWKLrSM6KkIWRfuIUKwRqr/rr847rHxKtb1THOG5MT/F8wTooPvGXo2
	SWMpnthQqR3TrXMyWxq6G13gZDwbnJj/gbOtgEmavZmAJ3cMdxdNiF1nioaKybbQWSZCR5vaSFW
	wOgP6ZdLNpqGeltssrMTPkUwFlgHSyttDAyJpEG2rScrRBW3dFLnjz+PItWMoASXtAcoNO6izbS
	4J622sNJwdR96qHWtOHjdrMc9RtTFSJtOwL8JvOAqxDmXYQHImslSH8oQtzGl+NmSpcK54cISE4
	7kNtjGnTR3NrlI3yO6W2zH9h0Y8olPMSh3K8vlyvfwIi2XQg6FSLQeToVSPg0C1806CBcAJyIVZ
	g==
X-Received: by 2002:a17:90b:2d8e:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-3933bd2c8bdmr6894267a91.1.1786742484519;
        Fri, 14 Aug 2026 14:21:24 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:504f:ca49:504a:79dd:fd2b:ca2d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387c6f95sm16678893c88.6.2026.08.14.14.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 14:21:24 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: clock: ti,dra7-atl: convert to
 dt-schema
Date: Sat, 15 Aug 2026 02:50:55 +0530
Message-Id: <20260815-ti-dra7-atl-v2-0-db64c147c2e2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQ6CMBBFr0Jm7Zi2EiquvIdhUcoUxgA1bSUaw
 t0FjAuXL3n//RkiBaYIl2yGQBNH9uMK6pCB7czYEnKzMiihCnGWChNjE4xGk3rMySqdC1cKLWB
 dPAI5fu21W/Xl+KzvZNOW2IyOY/Lhvd9NcvN+5dNfeZIoUOm6KKXLbWPdtR0M90frB6iWZfkAr
 90H9bgAAAA=
X-Change-ID: 20260812-ti-dra7-atl-4ec2740f9070
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786742472; l=1291;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=aeFKwEjKKufKQNi0yFU/UNw9tD/Mo8eyvfULfQC1wmg=;
 b=R8noTslQUZi2vITV6PVLc15cXasXbXXhviA8imkoU8eB0EBoMYdTzoCVsxvPww2DnNLwNvr1P
 9X2PZ96a6itCIf2S//KEr/Z15Dk2wgkXrnzGAMh09BV736R/AG4XjeJ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the DRA7 ATL (Audio Tracking Logic) text binding to dt-schema.
The original dra7-atl.txt contains two bindings mixed in one file:
- ti,dra7-atl-clock: clock output nodes for the common clock framework
- ti,dra7-atl: IP controller with register configuration

This series splits them into two separate YAML schemas.
Patch 1 converts the clock output binding.
Patch 2 converts the IP controller binding.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Added items: maxItems: 1 constraint to the ti,provided-clocks
  property, as the referenced phandles have zero argument cells
- Link to v1: https://lore.kernel.org/r/20260813-ti-dra7-atl-v1-0-27b691f4cdcf@gmail.com

---
Bhargav Joshi (2):
      dt-bindings: clock: ti,dra7-atl-clock: convert to DT schema
      dt-bindings: clock: ti,dra7-atl: convert to dt-schema

 .../devicetree/bindings/clock/ti/dra7-atl.txt      |  94 -------------------
 .../bindings/clock/ti/ti,dra7-atl-clock.yaml       |  38 ++++++++
 .../devicetree/bindings/clock/ti/ti,dra7-atl.yaml  | 100 +++++++++++++++++++++
 3 files changed, 138 insertions(+), 94 deletions(-)
---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260812-ti-dra7-atl-4ec2740f9070

Best regards,
-- 
Bhargav

