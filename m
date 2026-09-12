Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACE0374758
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 06:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789195259; cv=none; b=ERfZWrC+uC6U4Wp4ISV7Kg333ViiQw9JYEXzzXd04pbOMF86KO1nngcyjLq1Kx7PlfIHvox4B6iU0b5MRfjTvJCXsMW4uYbQdGTL+gPCHiD0oNi0GdNZgNrP2jh22ceavgYBLo+FY1/JSNKBbsHdGWTdeOQ5Cc97I7Ynu9Gfx0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789195259; c=relaxed/simple;
	bh=Zt1FOqW2KqdoRYXtktantBzoTQDsX3R4Zq/f08ZKesg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XsR7P+B1F8jMcJUY7TqpXVoMVUXiv3RpGT3Vbpq0zzYZGybsqjrtVTCV9Kyf4eJYuursKQ4kLgsvssR/v2x0UKUg2i6MedZFjOxouTRJAr5ZljJXiPpnljQRSL2O//iQf9LdXFPJ23umIbky9OgRFjvAar4p0LlyRqFucsbXMTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fi58I/Om; arc=none smtp.client-ip=74.125.231.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fi58I/Om"
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-8046c3d6e35so318036a34.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 23:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789195255; x=1789800055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q640RqR38QE29MmVFWdMcnQiW2Q7cR4iK1FcWO3aAjg=;
        b=fi58I/Om4SpWy3H9MKVurYtfbzLAPNGCP+iWiyuhSarAOyZFmJ90jrzUeX0uK8KPQu
         YgXmFx5Z6fWbxC1XE6vCMq7uBOAitIBJ0nYbFo8IiACk11GZZEXtmF2zIk4MGSAHf9Gh
         lMpjvuTspCXX+L/CJOyuYaWm9vn7+RmJkDNfGzHqRmg07UMy+nLkq+qzCB1YDeKBf5Mv
         KabTMs6iX6EAn5uNGT1IQIZNMth7xBm4hHKWv2W89Bx+cX9nzpENX0rgsp+aabtckjJF
         gNz3q5uSMDo015pIWmbv6Pn1CmYqJIehon5DDr1lV3XNX5M8xQyTz9jYgYbAyeJ5Bmlk
         916A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789195255; x=1789800055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q640RqR38QE29MmVFWdMcnQiW2Q7cR4iK1FcWO3aAjg=;
        b=KO7iSw1CIj/fD3k5PTDqswrjGD/1UdbSzcYeyhaoEy/qTaMi7d52Doagpts1vpKXGL
         +mCAPxliIpDBxVKhw/nJtVSewz0FvdY0Bp3GDNoh5QdiE2iL2Rmdae2L/Yyxgp19fAIG
         Ucf4b+t5Twss1iFFLiXhAjMDHSOHYhwR6P0idJSRjU4Z9uB+sB2aNt+k2LW+DINFRvTe
         ENPT6jEZPAE7yFHcPoiwEEyu+MVdyLfxPOuRV11iqM+x2tyCbdtMtvrZ5Au1NmjrJ3Db
         +GXlgE/H++wFpkE4b8BFizAnORW+oYybW6ZoIHo2NCIIh0Vfi+gPCFXw6rJJ3Be5NVEH
         rDBw==
X-Gm-Message-State: AFuF++lfn3aBHKbpm0UEwByuxh05eiG6DWOMnGppH8CRIBC8BbVAEEYg
	hwg13ueoAg4BVEGe0J3w5JHjvSJJm7fEVsBkFXvc1w3BR+x05IeHvtqI+UwZpT025fA=
X-Gm-Gg: AYBFou0QE1pBs2WxsiAE5DGU0f6OImS+EboANUyvQ/B2bq9bA9WsLsJdxwJUIx/8zUh
	jJPysdnmZgjd71Ii28bNb/PymBJ3Vqvhnfo5/MhkBX2n+zmNY1bSg6gHURy0Z3s+lN0Ylb5lNTh
	Joc99a+JCUIRpfQdGIlHOj1o0AI28shiydxJW7aOvid15sWy4cp5lCAIgx4psoeH6FCQ1Oi2AQ4
	wx2X3S8Q/yY210vIKzVn9/sSJe/hbniETprblCY+vdKnJ6bvQc/JAYAFb0o/YS3P8kSH6N1PYUR
	ySszaJEFwFcPvbihVe4+SXaRlbV2E0jxB7E8itCKuh4AgGKvv1q9pf3PQvUjZfjMjLZ/qaItxMQ
	xBYn/M/TNgykIqfD9TOK1YeO1bNLqf4cn4+ZUsk1xFJqbdOhBdd7c/FWANY8VH+zbKjlPx6WSj1
	ohcvNwnSmUQkTaiOZfdZkj+b01BnPENB//9KvYLAgda7Mv0K8sDvzy5HLQ6pSUzyJ1Dkk=
X-Received: by 2002:a05:6830:348e:b0:7f4:d1aa:2f32 with SMTP id 46e09a7af769-803fd871808mr7192047a34.11.1789195254741;
        Fri, 11 Sep 2026 23:40:54 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670ec82sm4932735a34.20.2026.09.11.23.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:40:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] clk: mediatek: Fix FHCTL DDS mask widths for mt8173,
 mt6795
Date: Sat, 12 Sep 2026 01:40:36 -0500
Message-Id: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CQAyF4VchXduEjmZAX8WwgGmBakAzHS8J4
 d0dYfkl5/wLmEQVg0uxQJS3mj7mDDoUEMZ2HgSVs8GVzpdncjilmqoj9vpFZsOptTt+lNOIPnQ
 VBd/LiQny/xklr7b2tdltr+4mIf2DsK4/qaqIzX0AAAA=
X-Change-ID: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789195251; l=1557;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Zt1FOqW2KqdoRYXtktantBzoTQDsX3R4Zq/f08ZKesg=;
 b=f+gU2KPV4GL3RlxKjra3EBgbSRpjeS0ghAYC7hkFJHSavKdwLttmPfViyyZOeMjxCFe3rP57A
 +UtDJosJl5FDBkDh1Pme7YytT+JN9WWHnOdfvJLKSqQ3pYoiBiSGLRM
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Discovered this while working on bringup for the Amazon Fire HD 10 (2017).

In f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping
through FHCTL"), and 45a5cbe05d1f ("clk: mediatek: mt8173: Add support
for frequency hopping through FHCTL"), the DDS masks were set to the same
GENMASK(21, 0) as mt8186, mt8192, and mt8195, despite not having the same
pcwbits (21 as opposed to 22). These two patches correct that.

Tested on an Amazon Fire HD 10 (2017), an mt8173 tablet, across 6 MMPLL
rate changes. All of them timed out prior to this patchset, and all of
them succeed with the patchset. mt8173 currently doesn't use FHCTL, but
this will correct it for the future in case it does get used.

I do not have an mt6795 to test with, but mt6795-sony-xperia-m5.dts is an
actual consumer of the FHCTL node, and switches it on for mainpll, mpll
and msdcpll. If someone has that device to test the second patch, that
would be appreciated. I do believe this is the correct fix though
regardless.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      clk: mediatek: mt8173: fix the FHCTL DDS mask width
      clk: mediatek: mt6795: fix the FHCTL DDS mask width

 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

