Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169389;
	b=aTU1Y0fUw9JADxR2sFmi/YE82S2Y9erIWGiUg+Z8sK00cHUlDSbfrmWnCZzBAa2ykE19
	 g3BT9qhYcBNHRKSEs0RaqZzJy4/8AF/oZsckbiWC+XKh6lsZImJLyVFAqVT7Q4EdXeJc/
	 yc3P4+kVjuBklssEOoU2o1VA/JSUInFWS8iLQpiiHP9pv67DgAW9w7IzNRwONGyU1KgqF
	 22F6CISmClChJvoC5AHJkBhPRAaHApgv40ZSyAJUI3I1qZ6lkztDJ/H/MDRVYoFl5O1wp
	 Gk5L88CWHDuOp2cC5jftELLsUgQkV0XJvYb9ykNDGPlwrRAjzZ7kT1u1/v7tL1+f5ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169389;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P+VDErKZ63vZKhJi+EBKSG0fHgr+I6l49in/SRyB3gw=;
	b=MPMqNBIeau+UX0YymfrzzeuHPX5wOhdmm08z6YDFj8yySaJFxFGlVt/CUtz002/S2BHn
	 V67H+R7pEDTlUz1PlyucVQku+v6uRJ5ISYpUy4btyGrdEo0ZpO7JJRCS5X4eoGKLmevg/
	 k/o/JtQjwHpKv9mwKBupMbXm8XRaRxsTRRlVBVwV3IoSMi6KSjfoWvVJ1jqvhKX1WtanR
	 7cfILrTCQ6YJwqMv3oN02JszLsl8KbUYLb9niGdWPN+zuf2t7jECK5Umfu1fexHXTxrnO
	 COvJ/6Jaomv+UQJSYV0W5ZzvKc85GkYsMCT57jXLjkH8Ge/xsH5R1uRfZaRXRtOwNBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LezOtyuJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFE1606BA64;
	Sun,  8 Nov 2026 20:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LezOtyuJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD351F008A5;
	Sun,  8 Nov 2026 20:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169388;
	bh=P+VDErKZ63vZKhJi+EBKSG0fHgr+I6l49in/SRyB3gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LezOtyuJHJZPU+nkAQWv9nWb4OQtoJod8I05oZw5R3dklED8QeQvyl8P9oXFTwvz+
	 vvKJBpRtL3Lvpjrh/bkNjISFVTy/saGTytuPqs4b75CdgJ5aFe6vlWnVqc/vOmkHzj
	 KFMPL7nxVltfzrxlB/zksgicbPE6g1+ZPvxyhfpJjtOlkB0wLihW/DRWZJHt4R28wc
	 HuuE03z4CZ5lqLoimuJ4cEP0gjGTKozje9c/lHueUYU11TygCJW+Dm3OFrQqKqnBH2
	 Yk3rEhWnDhUEGonQ1lwWktcdVw8IGx3Q+KZnuqZb1rJxvUajaOEX4U9bTRtQ4X7tCU
	 ExFQ/6T76Kmng==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] clk: qcom: Add support for Glymur AV1E clock controller
Date: Sun,  8 Nov 2026 14:19:58 -0600
Message-ID: <179416929561.628393.17086012699602989297.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
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


On Wed, 04 Nov 2026 10:37:32 +0530, Jagadeesh Kona wrote:
> Add support for Video AV1 encoder clock controller (AV1ECC)
> on Qualcomm Glymur platform.

Applied, thanks!

[4/4] arm64: dts: qcom: glymur: Add support for AV1E clock controller
      commit: 317a30a3e423c411c3a5d80584e056704d6eb649

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
