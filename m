Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169503;
	b=J3d/bC+RTkCkKSYl7CIA/uTK6kpl+V3Oayh73kOouU8BdQ2RY2iYgxJhkNGR+ilmtbG+
	 IbMQzcXo/fwp6Bg22xjWa/4vHOu7NcbKGPVzln0WEMfjy1fEkNywYnzJqdDgSgEwh7iL8
	 HxfFr4dpRoDK4a2lSYLm8TkxxiLfuneyhasadwqF7bPJjMOzT4sXTHd3DsRBe959L/Pc4
	 BR26foU3L7AxlxxINRxnqwRzAXPKpMQFXhEftxzpQknUCHQYYFzATrLlU07mlfUNWw3L0
	 kiYT2NC3p3VgnsbxDh6u6ULBdndxSVfJ2o0bYL+hqNA/Q35p6X68Bn42PiumiFH5O1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169503;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MbJLpQfsM3uPqy/QOJlRmCPPzENBOlXzXD7urqoXuv0=;
	b=V+v0mhO13tRy+crIIpRrdDd6BkQZI5LjqblqtkDcFVlROrLweH5ErKMtXOM4TvsNIXdw
	 1rA1DRFPSpTKn3CIiQLsR84BgCSBVSAlVaCpsVYC69aH7tiP0bjgH8swo1oGekFCKq5G+
	 vAaCy86RRnsPSPnHebkAMnw7fg1ecBE5GmaKNL5dc/f9DzlYOXnFsOM9i+srYSdoNT1Ps
	 wv+XhKE+FwjKBzI5k0yCP1faKdxPU3TZw8L+5M/DZQyiIEhEvLQlCOBfVxVLqgcBYEY2Z
	 iY1CGObeCjGFe01Y2HYMAxfwcvA304esaPyr2v7OI6/OsR61DNrECN7J7Y7p3Vq4BXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqqseCRj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178776081EC8;
	Sun,  8 Nov 2026 20:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqqseCRj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359681F008A4;
	Sun,  8 Nov 2026 20:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169502;
	bh=MbJLpQfsM3uPqy/QOJlRmCPPzENBOlXzXD7urqoXuv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CqqseCRjFMYOqmQnS+D7WXqCkI40GG0rOZrsrerjv/1A7kmoa6uz2Yn/we/UCaN5V
	 dLE8vA4Y35Ob/wm0LIIhAASYLRJakCZ/LHnBLcbnPwjNOqJ96C9N6SmvlcGEwwV3v+
	 48y62p/dyKMxnAFdWxzATYLHlf+v+EBI90cQR83CHaMo4rkfthal7meiyeM7rjjIt/
	 Vj+zBtXRoUeJCGC60Z8/nkUf4YNEwr3VV6j6OyeXH9+BMyQEO6zwn590GTi4M/CgUJ
	 bhMqUpLU2OdTIbQs7gVv1vm1GOuBfCTQIO1xBt5YHlfdXI3quY6G5wP/arzPvZqdEy
	 wDlsys0EiUBAw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 3/4] dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
Date: Sun,  8 Nov 2026 14:21:26 -0600
Message-ID: <179416929491.628393.16913187836121296834.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027-nords_dprx-v3-3-5d98b2c6c263@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-3-5d98b2c6c263@oss.qualcomm.com>
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


On Tue, 27 Oct 2026 23:38:28 +0530, Taniya Das wrote:
> Add bindings documentation for the Nord DisplayPort Receiver (DPRX)
> Clock Controller.

Applied, thanks!

[3/4] dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
      commit: e5182cab547786bec8d21c336f542abdf76a7968

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
