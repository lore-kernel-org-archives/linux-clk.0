Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787133;
	b=FJeS3Bub5X9XDe/Uwm86DACiQOhVYo6+Lr5vx3bVCVRnFmUakY7w8lGxwpQlmrz2o0in
	 NaJyJR62LCZk77Nto2uVrxTInht4wkj5uEQZCmPu/8inLsTNGPCFydqGvT5sasqTOjNM2
	 NC82QmI90Kz7e20mhBDxhhfrxibgG1NUTcpCndFDkj+Zq4M4frrO97UFJWlx9i02iT1Bu
	 ESFcUAQkX83+ZqPJAIFSDbVto+fKdlGALQIGdKWxXDekK6yR3t9Ah6Rp8b5m/YdwEzynq
	 mKACmUOH+IGABj/qp/7CfGYC0ePNfX1f9KQdonq9luT1vZTnHqWfR3OvRGVk6FQ91rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
	b=dWhvKhyGo3xhsP2SlXdyZQ2HiMhQEGQQIy2he5wCHpjkwMOWW/qYeFA3i//7nI3j3D88
	 lraFrYUNVChSiq4QetNRU6FfEciAHwKFerK1W2tbfsCqRPnZaPq5oFjio+5/Hn/At4AKT
	 kSObOnFCVHR4O2Lqpn2RsdEIay6au45ckLurDXisH/qVLQnfxnUO4V7jPyRiVqtHbSAFl
	 7Kalzj6hujtdASEYTWAJL5bjL3TbB1I1rMuOGpCK4VGs3zQtxKEhxX/QLb+bLHb70sWMI
	 WRNCuic82iLOVAwsxUaxSsh0iZQ/L9hW1KhTgw0EI8DZMRnDRJDlOBouWL5PMezGFRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PivZWo8R;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96512606A336
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96512606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PivZWo8R
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04244c3d0so63731545ad.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787132; x=1796391932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=PivZWo8Rof7K6W9Vheb0qp0zThUzh9oIVDgxc6i3q6xWx/3NrfyXUY9IA3TQRrg1KS
         87/9gnEPwQJghnt4GOIQu1d/7nHtLh7YyK3tzfpCIGi4kfTjK0xSJhvP3i5MjA9i34K5
         5+9amcagsLV30MUbkjRVZFuaQaWkFGwV7DXBKQt46IDPdNi1ADSQrkTLEJ8yad+fMHSA
         SHxNYXroc3W87etzrXbTif1r5krOcCxjXTn0SOc65Z68yE28tlLl615HRgWjQyEJtXzh
         mfcaRJp5cLzkTZ0Culgxn0PvYL58NGjpyjt/p3lhM3ImtleycWA/Q7jXXRplaRa2jbRj
         CPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787132; x=1796391932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=OXTgGPZxicGrrofoS88AjSZQ2Rt3bsLWS0u3bpn/OOsvtgdQTy7v1mitnVLZ2beXP8
         4lGPiGjCNbkN3P4KsBaOp0iSqBrSdZfkFuGzwqBZA3Lrico3QSHZVYigwFkmfEk2Ie8E
         h8LusNjhHkRbpnAUu+sStqTlJOgp7GRueq21pPeVWuUWdWMNumCDwujrLW3JWMjjIali
         ILj1FxwXiqSNOb/40cQL4VwQWUQR1yQcOukuPWxtAEjGofUCiT71BNaXIZxzjqKZAaYR
         W6CTrXZFIlHsHuGs2tFKlh2AMdRgBRr9AHUx1KueO+ffnj4aF011fPHEeIAiyaNkQSxr
         9IdQ==
X-Forwarded-Encrypted: i=1; AL+hErHigfa0FS7Vqmm9Xb4wbx4s22BewvHw67daOn5BSLSFTq+vMb5vVRIprHmltFjx/zlwfPdIo/a+QGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8BNzS7HhXlAEhu9EwDttnlmHvF4csYpgi9gAUgVDa3nSOsf11
	QVYAReTX5dtG7C/ZDRU/Pr8HnCFtCqCafs16aaLim+lQNUZy7YXjG3oQ
X-Gm-Gg: AZFdTZcXG/sjRdVB1GRENk3YdWw7fNIMQRcnx5UT1mo3eWtQtRfk+K1+PF0GB/TwnXV
	5IHrgKcIFsgK+8byEGWesXZLWXbAl5XImN8DJh6lSxRLJgN7E4QZjZBBRuW0z66fRin+2LAJwff
	RLId0SNGkQ+wbW5JXiTCWLK9TqjjWlLD92IQ46xPEPK6kqgBqvHzx8UANJfbp3ttcBhHYoI62ga
	NCy/04C3LLLjV0rh1ftkAsDE29x8D7l01QfhPw4Xa2W5D24Xmb0x9xH85tHh4UDig8FLDVNF2nI
	QXBATFO+nfn9eXagphKCEFq0GYUhTegf4KyMX/nnB86UDhhkmpNLWIHoii2hEgf4O2VIfi1ru5X
	0fVnlVbPNEvoClWfrsry9qBl2umPf/oi+kdbz1QgLkEOZDOEZdNl6r7vD6p5qTsi1JKzjtMA4wP
	k64K5ifizeY9fTgNsuS7+MRb8dQT1T9FmEI8B/dAERxUaAJP5N9DITndMEwn/ILh5q7ACBc31/I
	3ICWqk6jfpgtE/FBLwUpK+pRbkjizCi7NHFkL0FhDqfVkLpiBrknY4Ju/JRzcBrua0h9tjFs25a
	VtG+emF4G9rrypB7c0SbFB6jvP8bN9n7HoaTX30CYhntuA==
X-Received: by 2002:a17:902:ce0b:b0:2ed:acb:aa96 with SMTP id d9443c01a7336-2f03f11c934mr272576205ad.24.1795787131876;
        Fri, 27 Nov 2026 05:45:31 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:31 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Fri, 27 Nov 2026 20:45:01 +0700
Message-ID: <20261127134507.125513-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2

with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on

MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8.

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

