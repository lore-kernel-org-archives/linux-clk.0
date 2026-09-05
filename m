Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CD731715F
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643988; cv=none; b=bFs8yW4zBoUXPP5G3JxQ/Y8fdUsrmDGEcE1jX8+Om6tWbd1krObbWEkQ9/ud3Lt7bCiKsEBPUu3yHDHX7LCcGykBjOG+hP58Rdg5IVh13ZBxQQzjHpwt17Qqe7brB2pWuh65p4C9zwXH+m7ZrnI1/85tmbZ34sPlpPun7tZemC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643988; c=relaxed/simple;
	bh=9UJ4ID1SqwczIpWWbBOMjl/HJB4y+wZ5O5ZenYFnsP4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jatuo6WhRphwRM8A1/uBLc9d8qEUMwUpz4d9i/S2dnKH2VJ73rttstvUUR0Ar+h8LnsdH15AqZK6jePV1DhB+pVIVbG59xu4hrfExw6o7O72LLGX0u3RNSuVibFIWw4dHKjU9yTmdc4LIXuBgjZjCC0WItAR4MyAwnn5PpUnwv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=io22aViG; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="io22aViG"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c50so1831995ad.2
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 14:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788643986; x=1789248786; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XyGVgmspBFSKOa90eeJZ9nCd08vo4mMc1cOO4gNIWBs=;
        b=io22aViGEzokgpzzlogr9f45Hq4PbkNfMeUEe+BwTTUx+WuoovZMgIedP3nQ5dzrYs
         tUvyCociLvZLJOkE1wk3YOLlqsUXIX0rqhkdu04KzK1FFZ/fYUn3RMd6m/iv82TUjn4g
         tNeFKpvu88dhebOEn8bhUcucxJYMTN0hiPu2fg3qkyGXO1RRrhLdWCAl4bvNytt965hw
         Rv/5t8Qy/5XtlMKSoJF6ERl1OXO5XyXNwhEXcZjCyUR1go/gB4echf0SdIBtYOBEWoVJ
         EBwO3kKFm3kDOvmspW0/pFmswpbkvae3yZrCys0a+yVQtleZ2JxHJoOJuRK/FnZ7USOw
         M0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788643986; x=1789248786;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XyGVgmspBFSKOa90eeJZ9nCd08vo4mMc1cOO4gNIWBs=;
        b=XaDDCRHwo0a64v1NamfXovbUDNu9hWr6NOZ82b+NP80HAc+KIjnXgDFK+E2LFfM2nM
         ccDP2VSBYtVFXqAjhhNCUEZqzP7qYiylkgDGa8LrSbTJzxx20jzam6tb1ilFMcPQsR4A
         2ofDFgJ4dBOPP71kMB4o+1E3X35/LJvNsI4FqsWVW3tLr9QVaNmON9AiNV81BwVuNraU
         UIzaSal1Gj+cAOOtNDoQpwMxYIAdjUsnL8zrvIO+Bjxc2SvY3zn3M8DdFErqbvDOk6Wt
         D66AZoke3hidrAEMD9b1V/Q1PEomtua5HdBizcfqQaLcOuDapogyJsuRSr03aZRVhuS8
         uIhw==
X-Gm-Message-State: AFuF++nlwYZx41YP59vBH/it2DJB9BDKBqkffHbeXhzzH280qxfFDDrn
	PzhZMn668IGNJd6GlwkQVVuXZTDc0BPiknH5u5MJbtYHZTaZ3k44bETY
X-Gm-Gg: AYBFou1PR0LeOIp1gaTfkHAgWSl25PuntXJQnCQn7ndkZU3gR3bogFOKd89400Zgvj7
	aKaZ4WRJAT+PXUSrcPUV4rmRoFyY2NeGTImgupBw71F/qzJtj68k/vVRy8XV0ow4boP60aVFXMJ
	wt1t+dM3OgwPigFeJVD4FfOcuaahxR1pdp1JAiLG08nAXM9WBKWQ9KE5mPXPSXUYKGgpLDMU6m6
	5r2UecLoDAczXrI4YR6GUtI3jL4BYqiqJZFjM2WU2ogPUvKUrbWRZjPU40FXlFDLKz5ShKiVRtn
	L977llP8c+AxBGlKSgV0MI4lH8Kv+7jK3GAlG66zlyUZSYfl740XgFv2pCnv7xqCuudgUoSx20K
	Od6qw5b0koCTLoJbZx9ST4U7zdpXYPxSZXACY0Tq3ePyHbv+CkWl05NF/ayr0xao+At1yrwNbBc
	HTGO7mi1O1Pz+mAnZPdG/dhplyeqbYxKJXBPIiGSaetKdxB46HCFJPNzpVmJJ5uCEICwLiMKX8d
	g==
X-Received: by 2002:a17:90b:2801:b0:38f:aa76:88b with SMTP id 98e67ed59e1d1-39b3d7d056fmr6825771a91.4.1788643986574;
        Sat, 05 Sep 2026 14:33:06 -0700 (PDT)
Received: from [10.63.138.252] ([2409:40c2:5007:4aea:63cc:914c:1243:e03c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm21538010a91.14.2026.09.05.14.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:33:06 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/2] dt-bindings: clock: ti,dra7-atl: convert to
 dt-schema
Date: Sun, 06 Sep 2026 03:02:38 +0530
Message-Id: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNyw7CIBQFf6VhLQZusVhX/odxQXm0mD4MINE0/
 XehxqRdTnJmzoy8dlZ7dClm5HS03k5jgvJQINmJsdXYqsQICFTkTAEHi5UTHIvQY6YlcEZMTTh
 ByXg6bex7rd3uP/av5qFlyIm86KwPk/usd5Hm3b9c7sqRYoKBN1VNDZNKmms7CNsf5TSgXI6wd
 U97F5KrmopJyrgEDVt3WZYv6hwtBfQAAAA=
X-Change-ID: 20260812-ti-dra7-atl-4ec2740f9070
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788643973; l=1453;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=9UJ4ID1SqwczIpWWbBOMjl/HJB4y+wZ5O5ZenYFnsP4=;
 b=ZwBnH9Fz65KpIlRI6GGGP700zZGQ+0Gjj9mHkLSJXCileSssepzHtbunho04P6EYba9Agf/kc
 paK+yQ9q22vDRDlwPEaWKRfoPJ8WQpbpi1Se5e/4LYndmHXBhRphoUM
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
Changes in v3:
- Rebased to latest mainline rc.
- Collected tags.
- Link to v2: https://lore.kernel.org/r/20260815-ti-dra7-atl-v2-0-db64c147c2e2@gmail.com

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
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260812-ti-dra7-atl-4ec2740f9070

Best regards,
--  
Bhargav

