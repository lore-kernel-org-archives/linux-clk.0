Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAF4C6F16;
	Wed,  8 Jul 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522636; cv=none; b=Pjjr/TNFgaBI+BUyo9NH/HtX2WSqpuCdm/dYwCAFj8Qfdmp7U+kAVKZkUAhL6FT4NHgYZkTbtPyHg0SetMViyqFVa2Qaw+EpwqVc7JjkVPbXB4DLAabz87pRO2dw4QjLtzwpx6S/LoUEGwZIyQu7q4lOgsOwIziiW9HCw9ZNQSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522636; c=relaxed/simple;
	bh=5yhOIY6EeIe2qy5Zt0ltoCyxQqu3Zj/XMFPY5RZ1drk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qfsYEBznf2geCnL03ejPcWSHLrr/MVP8M/WwqhT0M3/tiZQLnlxhVvGJKuPmtZUKiwnrz5NThIXK7pbiornVIWLGmWev6yyy5AXNav/v6elUeZWnNE26yzfUvrcdl00bDPB7CEmCg8mUkdQ25bEliJdgoxyxdzTJMe7vxUptxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBTJV9Td; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBTJV9Td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD41E1F00AC4;
	Wed,  8 Jul 2026 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522634;
	bh=jtRoaleXHYtvwj3YsxcEm5vvvb5LD6sGb0KJPRIn6bE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TBTJV9TdKSBN4FD7dz27nYiA9jgvXMEJe2sV+GjyI/tj9X/9Zf8x45PxkhI+EX4Di
	 eHfWlzi7zlJ8j6+zKzDSF3s266lIH2rbPoO0oDYEnyMvSdRq+muBU7ncOwEtY2a49z
	 MF4Fsnd61cbAd9XY39CyHCaTBfekNrachdkTrjFhHtOqxIhS9pf/UqNuPNn1ihX8zW
	 4MWRgvz1LsQRkReF5z91PJSvT3MBxLPMzftwgybVJxRbkKFq+zScaBCVqhx1ZG5qe/
	 e+V1lpUygZxIndGWCR7D0X4J+nB/1t7p58xRe75VbBcRAIL9lwTBpAXukd18EeNe7l
	 gp0PTa+8CX3mg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] media: iris: bring up driver on SM6115-based platforms
Date: Wed,  8 Jul 2026 09:56:15 -0500
Message-ID: <178352261575.2235436.7747224578732326606.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 May 2026 14:59:23 +0300, Dmitry Baryshkov wrote:
> The SM6115 / SM4250 / QRB4210 platforms use the AR50_LITE IP core as the
> video en/decoder (the same as Agatti platform). Extend Iris driver to
> support this platform. This has been tested on the Qualcomm RB2 board
> with the normal HFI Gen1 firmware. HFI Gen2 firmware for AR50Lt doesn't
> work yet on SM6115.
> 
> V4L2 compliance for Encoder fails due to firmware / driver error:
>  qcom-iris 5a00000.video-codec: session error for command: 3007001, event id:1007, session id:d3b1e000
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: sm6115: add venus device
      commit: e0511284f0c14e2929aa6cec435a9cb8bec259b1
[4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
      commit: 43611ba2955c1f349a0694b7ad7ab6a2794910df

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
