Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A71C32E722
	for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 21:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764019226; cv=none; b=sPpK8x6L2MAaxZm967ZDXfZZEabv1bbEp8v/4iUJBoCm2mA/8xkGM+dlYRndlTHRIAXWMaVLNArJasZrHZgUZMpk/yEjXUzzUpHbbBA8JefEsE6Np2CzwXGnu/jo5A4/l7PZSujHJxSt2GqYL5CzgVIte3ODm8OCxWpGe1/e4aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764019226; c=relaxed/simple;
	bh=2YFBmosG1IbwlVcJv8IGGNgceYoLIEglKEl4QUeiYy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQuf5Wy7gQVxjhbAUWovGbioo7PCVejEj9ifUzyxDzSGk0YEZqjVnUwqsuCJu1Q5DpuynhYOoZNU9TK7OGPBM1y+sFi+YcNvTV3pvYj4sYdM9EzC/nurYQcMGQUgxYSKKrY7kMUSsRkTgy1QEgyihbJKASPNYIutaJjQm1MYVec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S8l7G5d4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8l7G5d4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-595867f09fcso615967e87.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 13:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764019223; x=1764624023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4FyPq/kYWDGmVTcOSat1gTBwxi7ftUH1FFrkSMn8JA=;
        b=S8l7G5d4VL7CItsCNzq9v8MM+V6+ybPu3sCPOazETO8ogZdIRGmcJecjXu+BE5/qPS
         Hstn65z+inyYA4QIAm3qsSo6+tSCKMh0ke1sbw3Ti7kYNWA4QOPFhK6rZWgur8H6V4ZD
         IGa6zeXp6/AcoLO+R1urFuEfIG1v7Ho+LdyLikejNMW5v6JK9rGQNEoiTUtJPIXHxiyF
         BRRdI/kqWrvIcUb5152dKYbQ5WdCiJMb/ZuvfPgT3DPCwuJ3d9Ok2of7fQSKb7nAuR/X
         7nYHo0W8e0XKyMeFFU23hMkEqvDTFu9Y0ydEO6bpPgYLlQdJ4yiNBJINpaCvPWFv0NQG
         olXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764019223; x=1764624023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4FyPq/kYWDGmVTcOSat1gTBwxi7ftUH1FFrkSMn8JA=;
        b=LDvQyY1pKgytvYvXcY7o4WRdUoxIFS6ewt1LUskQTLcfF9iO/vU2KVhvY0QC9+bwRM
         aixLeIhPAr8rRMK0HLdZ43u2wexf1sKrmDw44QhdH5/+HH80d9LvasA7RYVRpB6AntTA
         8gPB5uqZO0mQAGwRgYnbgebkDC66sCFrPx9UOzhvdiH8OyEUeOlneByBe/VQxJzozWKe
         jY4qof5fJ0Qm79zmRWhX+vmX7UkQ+5QZbAdF38Rluk0I3DtFCW9g6YyKpiqGkvXva7jl
         GkLeZWHX2xNm94rqpt2KAjFatnYKo8bVLPB+JF/RRkbPNZFSzn9cQ1/NKbceJo5UDoVa
         O86g==
X-Forwarded-Encrypted: i=1; AJvYcCWBqWaVBLe434sjq4rfahrjNAznwCzhnued3emnYzWVXx7M49Z20eMIhnC5uKsmz7zukwXez6XAWV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzodHuIX0cykKCnJTcRk+WG/W9W6rDWz17IwcMb7ZaKNwBoiFIu
	v7rkeGZgHTnsTlD9cL2goXH7HQk+03icQnu8zFTHpJPIQNaJuVU0hFqMhYKvnsrJnXU=
X-Gm-Gg: ASbGncuoT3cUsPLBIPZK1eBGxHFnQNffLRiLHP7o7KBkvFnIQYQRWcwMQtrTIUyXYnE
	9Mkww6Z1FkO/vRS/Hqc+i/Y6IAITvfueURmoAQO8p3x7AUs1G0fFY3jRnDL1vHHnBSUBfbzDiTG
	ZBnXW1hZEowUpFhu34JlV+FeDGfceSnFOLuqFUEHtBSdpV3Ax7lYicaDDoRJiDDg3qjLA5gLyLy
	dTAbgjpsaLLYTILpcydyoC5b4S8Aueta7psbs/FzRShEWVZujmpkQjFTpbxIE1B4u2nppS4fzo+
	VmIqtCHuIK48koK0cauRpXHRNe1XnkSIDvqC/lVs99FY0JEqxKffXT0P3jqOVPB7+Ex9Izrap2z
	UmWvL29wa0pnCHF9deEt5G9s7av8ksxWoqXNzn1eq5PF/H4gQ9c7ZSkw8vHSrfeCoC+kJSa/U1q
	I16TT99FvpR78gNBTv1B56zvBykvi+VgULaWHWxJiG03KDpm6b1giD8fr4sNI7RFda
X-Google-Smtp-Source: AGHT+IHWeAbuBKw6C/nTuJW6nxAA8zubnC7DGnvX3LzKyVbi9xGZ9FuPTPMPAeQp7212bBUVXrqXwg==
X-Received: by 2002:a2e:8a88:0:b0:37b:991a:543e with SMTP id 38308e7fff4ca-37cd9218abcmr17247201fa.3.1764019223289;
        Mon, 24 Nov 2025 13:20:23 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59744sm32905771fa.11.2025.11.24.13.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 13:20:22 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: gcc-sm8x50: Use floor ops for SDCC RCGs
Date: Mon, 24 Nov 2025 23:20:10 +0200
Message-ID: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
powered boards set floor clock operations for SDCC RCGs on SM8550 and
SM8650 powered boards, tested on SM8550-HDK and SM8650-HDK respectively.

This change fixes initialization of some SD cards, where the problem
is manifested by the SDHC driver:

    mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
    mmc0: error -110 whilst initialising SD card

Vladimir Zapolskiy (2):
  clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
  clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs

 drivers/clk/qcom/gcc-sm8550.c | 4 ++--
 drivers/clk/qcom/gcc-sm8650.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.49.0

