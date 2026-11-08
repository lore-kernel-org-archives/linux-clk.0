Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169391;
	b=c3ql4L9PuekgYMzwyerihgyW/4L1bWjQIVrlAGEGhWF3VN7LnDOVy6VN5MqHkYkpg3sA
	 s19/f3t0RSdACT5RVfc27nleqE65GNpzFBtPYhgvxFlY1bPwFGC6R2zVlEXE5LUuJ0jno
	 cCAJRU+OEWJoo12+hLuPqnlYUN5WGyW4xkXjKOPK/twx80HahwnlKGaFk5Yqf0NMMCaW+
	 x2nvd38s2LBrTS+pc0RWH+WUOd6cDVn4s3eHlpThQrCM/fN4rMfSS6sIBn/59YrWsCBif
	 GQD78C2Fuo/bSVlLwVfT1Lu/wZIFscquNn3+YTM+E7TFB8x10jtoWBxR5SuagBwNofg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169391;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1niYB4/2ehrsrZgjTei4qsNtyyz2W1DlXFO7D7AcvtA=;
	b=suRxqew91t8+cnHBCZlUsddOSDvTFB2EpiqI8aA9qyGZlqP5OZrjgg+fVk4aCnIe464I
	 6S8bVl5kmoH4y2JnozFyimgn+BlV68iPgKEsFi52jX0OuQAffKhSpOyo7kVsFMJ5vbEje
	 m4uRHirBRnAz19dBxNs905PxqpFqZ5qN9jActmJSwRFHRu+92hlvS/Kd0m1wIy2JXfl89
	 wc85L6+VtrrzOiAPCdIWTM6S0fvsl6uJ1ntB5v3cIB/bd7KE9EpCoDnQa91vnhZgohZ3G
	 Fkq+bjh6X4KCrQRaaB58FhDGtZfkvmKoe4jfk2q9j9lMdBV7Nv7XfNCCvPuFSF14S1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SUxn+aZn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9346606E51D;
	Sun,  8 Nov 2026 20:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SUxn+aZn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942CF1F00922;
	Sun,  8 Nov 2026 20:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169390;
	bh=1niYB4/2ehrsrZgjTei4qsNtyyz2W1DlXFO7D7AcvtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SUxn+aZnwHL3kSmrBw3rH1SK/QJlUBYSraUs0i7rPd2qM3ysb/8lAj2o48MxBIh+6
	 ahmC8itFtHjSWyi/ztK7/yzkjfmbwrQ4xF3JZCuAZso0iE725BvsENBIFvZ1XwAyG2
	 mYQMIlQK15qWzdq5wrPy4a2E2gC/RYPbcdvQHOAZPvRor6HtZNQF9dTR1ZT9Og7gjc
	 Z+Pax+6dBHyz+fQgibXoDTtxK3+ExG5A8K0ywKuyfL3ziDWe5ah59Rffg75lEb7WZ7
	 B2nULiZ02gzNY90C072ikEbm4uA7hCrl3fl1jUnfki55xeGEx7XLe+kFzYxmDxu4e1
	 JRi1+hoHEopXA==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 2/4] dt-bindings: clock: qcom: Add AV1E clock controller on Glymur SoC
Date: Sun,  8 Nov 2026 14:19:59 -0600
Message-ID: <179416929559.628393.15113236846453035838.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104-glymur-av1ecc-v2-2-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-2-7c25a73fe811@oss.qualcomm.com>
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


On Wed, 04 Nov 2026 10:37:34 +0530, Jagadeesh Kona wrote:
> Add compatible string for video AV1 encoder clock controller (AV1ECC)
> and the corresponding bindings for Qualcomm Glymur SoC.

Applied, thanks!

[2/4] dt-bindings: clock: qcom: Add AV1E clock controller on Glymur SoC
      commit: b7da3a5bced40996bfe2bee44ecdde4424ccd037

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
