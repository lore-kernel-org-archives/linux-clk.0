Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169497;
	b=rg60ZLHDNFaWwhF7kl0UaY+cq4oeRuHoFXBA5sOuqsMT9R73M3UgIoVD1/JhRFNxDToN
	 niHs5zcitR9veHIp/qPQgdfZn2ODJiuvCVT/AgS02/+KqYaCSOWcBelaxQ1rG4/SA7pMl
	 Hqqq3M1q/Rp+z8c6lmEPWJeV9cz1IPyqr0yevZwCEYr9jpC+i2e7GJyal3IxjWyel7Xna
	 VOi8frkqmrHKsNQ44bky2ixN76rzQrJpe85rOGc0dAI217TxPRXqAPT4OYjMK6P86c6hw
	 LiFGuXTOp+QRsfu4rENnqCjH1kh3EiVGDKEdSYlFXIaDKx8qPFWqcYHW8D4qqGmFjGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169497;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SeFUowNQ0nozaEIHfSfyI4+heOEpEkVwO2iJYeXPgfI=;
	b=v20ZfrGkL1cKpDx49rDsPa6SM2n0Kl+EqOZBwDDc8o8NmJbizO0DW4AREwAcCkLnP9ku
	 hsjvZ4GHoYIQLAOW/OwW3xC/RmKfPqMIBp3840AO9ti//3HvMwhNlBMawVARNY1h18b8Y
	 svPH7P7tcIDD4QuIZCiZGnmL9x0QPM3IXA7hrnNQmIz+PcO96iVU/OHE0bio701kevsPl
	 lbBUUz+tG0cq61AtZaO1qpGAu6lAD98nXzhFL7V0GkUVO8La6hC5+xm5SWnLvTLuK4pLF
	 pA2DtU4tNfd+3flc3aA9UkJYXr5BVQdumKMw5nLpe19/LY9fy+pLP3y/KHlI4iIt5ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Id2E9wE0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820E6080C57;
	Sun,  8 Nov 2026 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Id2E9wE0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E566E1F0089F;
	Sun,  8 Nov 2026 20:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169497;
	bh=SeFUowNQ0nozaEIHfSfyI4+heOEpEkVwO2iJYeXPgfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Id2E9wE0aO7F9kZWfTaMbE8HoWi4ZjcTd3xwUA6IG6Vx9LEiD21ryCsVSTCLmMVpk
	 T/O9HEgakRgrCFphFdWdoWHnNtmFi6S/0d4oWCCloiICYq2OLK+Hck/uG1vaXyVhsu
	 IlPDfB2nEPfsv6+tVjADOFZEPOnTqFjqGR0SSI+YHtsCFbFyiKQ8FHHKA2N6aOwVUL
	 zl+txy72IQ74+8BGNRsbn+ObdT8U2TjVfEIuTYbHkxJwef/QQQyo8VWkG7swE27dIj
	 sPR6Az/FyNA6DF1gJj5jUOPmVpWwx3WnucKbFD6QtzbEuGKv67f6Cf4xePV0SjVVY1
	 KbJbgh0+TfQPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: camcc-nord: Correct camera clock source tables
Date: Sun,  8 Nov 2026 14:21:23 -0600
Message-ID: <179416929271.628393.1303915456540798087.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
References: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit


On Sun, 27 Sep 2026 00:07:10 +0530, Taniya Das wrote:
> Select the PLL0 odd output for the 200 MHz and 400 MHz CAMNOC RT
> AXI rates.  Use PLL0 main output dividers for the 300 MHz and 400 MHz
> CPHY RX rates.
> 
> CSID and IFE Lite use the CPHY RX rates, so share that table rather
> than duplicating it.  Remove the unsupported 300 MHz CSI PHY timer
> rate.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: camcc-nord: Correct camera clock source tables
      commit: 3b3328b5c58d92d8025b71cd2e11eda420dd0ad2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
