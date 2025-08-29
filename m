Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2357414F9FB
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 00:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427923; cv=none; b=BlSeFOVjEG9oMViJ6yQh7ahx1GBzq9If0qxLwbceMSxqXWfzmWX5HxdOl7VeaCHIBarzYZRnMSpuZm0xySt+cFZw6G2TpL0FNadOnjou2QfeiorEpM96KJNYjDtQxrFPI+AsM9WrHlCdFcBuOkrIz+5WacpdNgF96g7e4qxisYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427923; c=relaxed/simple;
	bh=qOHN+W3Wz6uTZsr/RwMmfVYf0YXCACp4YcP7f8Cqg6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fzRkRarPunG5h0PfQ4iBPVcJ9Uf54YYGE201ipUbyU0IeEQ/EvphsT+rKzvJ/kboml/Bc86tEYfPrmHti7def2i3ZM47OkSEfrN/Z6GkcsubWv6nlk7ndJlV1trEIuHEephui2ODcEQCb0jEpg6aBsHLa+aprcWHiQnS757vuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NOKShaYD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NOKShaYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8rqunLN033sFAkyGdyaLYf8O7m070HCgXqjcGrGgaTc=;
	b=NOKShaYD+8QvXuhzhMov4G0+GH1TZYrRYdFjtvBFtAXHB7ig7i8ui/kEQZ8Lxo2oOmebX5
	Y8e9IaR5ld90Z9S/t6DaqCcX3fI6EOpJKnbkPKi7EONSEysv1qBhrWLaKzpKILXRsp/NuH
	xt5kwGr7UGUtOEbv2b81R2PEjIIJ0Vk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-rptIE6exMeaGjELkl3ENHA-1; Thu, 28 Aug 2025 20:38:38 -0400
X-MC-Unique: rptIE6exMeaGjELkl3ENHA-1
X-Mimecast-MFC-AGG-ID: rptIE6exMeaGjELkl3ENHA_1756427918
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2ffba8809so27363951cf.0
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 17:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427917; x=1757032717;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rqunLN033sFAkyGdyaLYf8O7m070HCgXqjcGrGgaTc=;
        b=aMuy/djHnS0EEsbANMnz7FZDsP16aTimwov6fOw/INOOnvewRyJ0AQ67AhuE8Kmj+G
         GltZJQAhDXq8wYoXSfDkY6nBzMMA74BMBTJnK/S0NoNHudHp6wHsNI5jGGp/f1OexEC9
         U+QvkjljkcinIBKHV7Ogj1SboAq7CkPCB31y9gJm5y85XVmCvJLGIw8l5FD+BG62UUJm
         /POjC3BsBZVVqHpq/+tKaqvAerHtox9U6t5hm+TTI/3AtXXQ3dMaCq6RbOMfiwrbNtyS
         p7noMVEGuR9HEIbIBFpqc+CbIsLe41hWSm6+cb1O9kt+I2MovP8FCP+SYL/vDlHO88o1
         5WZA==
X-Gm-Message-State: AOJu0YzEqdVQJQ5MTIx5vmJRxL9KsrhCgLCyzYSQSQ7GWK5KfgWX/DEN
	FgH0AgvMJTyy8vdk4dVoQybzC0/ZhiVuXI4iYYufTV1+QXJDE3kuO+82C7JylNAkAQM0fsamSu9
	IvPeOlFhftgrhqnVhQFhLQqO8EAB3B0rspkECZY2ssPvbLDp2Cohi6SRXCR7JXQp3yNaoQw==
X-Gm-Gg: ASbGncuzDtv1j9P0m0q69ZHVVr1ms4AelFahUFK4UsIFV4BcX1MEhiQC5N4l2R6yUC9
	rw44O6x1m37/sOr3tBQmhGcWS4kHZINnSKP6CSjsi6XlTSoYZbQf/DAhMumjCt+OBM0VujxcfOL
	tj0kh/CIVVrvh4RCMlOTOONdISPDqi8VGc5AO95WipZaJ5s2BeE2QRP+fpxotVn5woNR4+H0Rme
	l0WTIdjKuRjPVJLR/xa1qCPZhskdeAvscyJwurN6Qk6YmU+8lS3nilEMYj2p2PdTGCFPGJ65SDm
	72kxnv4MWGbmMJ1fG9s91nfJpY2Uw+zMj8JPgylgelmhphjAmuRl9RYAHE6+NTl5cqXbh6jIwa9
	HPavVijlEmlOog6bU5Myu3yf+SIKZeg7idQ==
X-Received: by 2002:ac8:5acb:0:b0:4b3:7ec:d22d with SMTP id d75a77b69052e-4b307ecd715mr29164811cf.20.1756427917017;
        Thu, 28 Aug 2025 17:38:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrNg2tdKhgAQRayLc8LgRw9eIVhmfPzttivKDw9wQ2+vibEJMjJFoedzMgEqufDrqQJ1tp1A==
X-Received: by 2002:ac8:5acb:0:b0:4b3:7ec:d22d with SMTP id d75a77b69052e-4b307ecd715mr29164561cf.20.1756427916486;
        Thu, 28 Aug 2025 17:38:36 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/8] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Date: Thu, 28 Aug 2025 20:38:19 -0400
Message-Id: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHv2sGgC/x3MQQqAIBBA0avErBtIQdCuEi1KpxoKi7EkiO6et
 HyL/x9IJEwJ2uoBocyJ91ig6gr8MsSZkEMx6EabxmqLfltR9isGlOEkzBq9GpVVk3E2OCjdITT
 x/T+7/n0/tcMa8mMAAAA=
X-Change-ID: 20250828-clk-round-rate-v2-c1b181f598d9
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2337;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=qOHN+W3Wz6uTZsr/RwMmfVYf0YXCACp4YcP7f8Cqg6U=;
 b=2DUui3a8WkDmdWMGxKa0tpZlU3l9oMHhpwiGjtyJgflCFJnuf9oCUJ5nnO47Aeh60KidBjjhF
 owMBgQLSuwVBuDusC8N4CQta4YOJg/XwS432e14Efcrlr58u+ubkwbg
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Here's a minor v2 to my larger 114 patch series at
https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com/
that only includes 8 patches where a v2 was needed. To reduce the noise
in everyone's mailboxes I'm not including the other 106 patches that are
still valid. I will supply a 'b4 am --cherry-pick xxx' command on the
other cover letter to exclude the patches in this series.

This series has no dependencies and can be applied in any order.

Changes since v1:
- clk/rp1: Updated to avoid merge conflicts based on what's already in
  linux-next.
- clk/sophgo/sg2042-clkgen: Removed &*
- clk/sophgo/sg2042-pll: Updated comment from round to determine rate.
- Removed unnecessary space after cast on these drivers:
  - drivers/clk/nxp/clk-lpc32xx.c
  - drivers/clk/x86/clk-cgu.c
  - drivers/clk/zynqmp/divider.c
  - drivers/clk/qcom/clk-alpha-pll.c
  - drivers/clk/rockchip/clk-half-divider.c

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (8):
      clk: nxp: lpc32xx: convert from round_rate() to determine_rate()
      clk: qcom: alpha-pll: convert from round_rate() to determine_rate()
      clk: rockchip: half-divider: convert from round_rate() to determine_rate()
      clk: rp1: convert from round_rate() to determine_rate()
      clk: sophgo: sg2042-clkgen: convert from round_rate() to determine_rate()
      clk: sophgo: sg2042-pll: remove round_rate() in favor of determine_rate()
      clk: x86: cgu: convert from round_rate() to determine_rate()
      clk: zynqmp: divider: convert from round_rate() to determine_rate()

 drivers/clk/clk-rp1.c                   |  58 ++++++++------
 drivers/clk/nxp/clk-lpc32xx.c           |  59 ++++++++------
 drivers/clk/qcom/clk-alpha-pll.c        | 136 ++++++++++++++++++--------------
 drivers/clk/rockchip/clk-half-divider.c |  12 +--
 drivers/clk/sophgo/clk-sg2042-clkgen.c  |  17 ++--
 drivers/clk/sophgo/clk-sg2042-pll.c     |  26 +++---
 drivers/clk/x86/clk-cgu.c               |  35 ++++----
 drivers/clk/zynqmp/divider.c            |  23 +++---
 8 files changed, 201 insertions(+), 165 deletions(-)
---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250828-clk-round-rate-v2-c1b181f598d9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

