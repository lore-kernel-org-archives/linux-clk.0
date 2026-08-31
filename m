Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A2C388E46;
	Mon, 31 Aug 2026 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207713; cv=none; b=AFAf8h61TjwAjdp4PDpCI/okNIWywmgt8Js4nT72rtR8GZK5LWTDuXsu1RbsqwuYt4pWwowSnzeuGNcsmafOFUW5ci07CQTSycXI/qEYnWcaRDF3IMHsqw+vyOgJblrfxWvXrnVOzoEHb6piq+3pAs307fMNR+LqDD0qcLQT5Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207713; c=relaxed/simple;
	bh=7nI3kNPQwnYqe4dt7ndI5E8gWXPyEPTZNf6gCb7OOBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+zst2NCcv/DhrAy4rsPhALV/KEQ7+IYv82Qcz0vJEEQNrurF2vpXxPDIWs9G/ihNaFsCuyofAEGXZhnuVuqhmDaubwQh04ZlbjJa5oC6QxJi96UHDAcDrMDR5Eb+filOucQAmrFmY1cTO/l5p7ziZfFkTC3CSbxt96umqy2rjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cwh/2IiM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cwh/2IiM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8411F000E9;
	Mon, 31 Aug 2026 20:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207712;
	bh=we3LHapMrXe47u1JBAesusbnbfi1RZSVTWPihX5IJ1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cwh/2IiMTB42mrSV4HW4k6o3qPCbxycPY3VYKa+fK/TDNqbehw2HFQnzZYGiJFY1S
	 ZJe/5K/agoqWyubutQlOqh2+ycSYfRfOLj5ITCeqvUY/6/xFyYTl9Zwlb59CHpztkj
	 tUZ5Rv3R/4I11rD56iz/Gj7d3/4EW6JdPi+pTZoZZT+qjC7uWQnymirmBWAYL7ST5j
	 cncOoKjDMobphbk/Xn+PIClPTTvQqgkBZMvRkeXtmAR8oRxHIhKUb9omvcZmSeseo0
	 z91pnO8ui3HIw9QfsFpmiTzRr/7Fp13TlncJGNIAGAr2KZs58h+OipjVcWKQ/2CL0e
	 UyvEPgICAIZjQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/6] clk: qcom: Add video and camera clock controller support for Nord
Date: Mon, 31 Aug 2026 15:21:27 -0500
Message-ID: <178820768666.1699313.3176059404911714855.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 19:43:51 +0530, Taniya Das wrote:
> Add the DT bindings and clock drivers for the Video Clock Controller
> (VIDEOCC) and Camera Clock Controller (CAMCC) on the Qualcomm
> Technologies, Inc. Nord SoC.
> 
> The VIDEOCC driver enables video clients to request clocks required
> for video encode/decode, and the CAMCC driver enables camera clients
> to request clocks required for image capture and camera processing
> on Nord.
> 
> [...]

Applied, thanks!

[2/6] clk: qcom: nwgcc-nord: Add video axi clock resets for Nord
      commit: c07297f8e0e7dda7589c74be7ad570ef3a244efb
[5/6] clk: qcom: videocc-glymur: Add video clock controller support for Nord
      commit: 7f26939a78de32f9f2b0b9cd67c311ef4a0caf29
[6/6] clk: qcom: camcc: Add support for camera clock controller for Nord
      commit: 7647815dfc8f7282ca37bb28fa22599edd9bb597

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
