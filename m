Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877504;
	b=B9WqbTsuHkonvvxk7IGRm0l77tvpUtHFwuZh+tL3bX+TzflQns5lL3Rh/UiI1Hfw63Dv
	 OATXARcyw/nPQ0XDqWPcG/Abg6Z9uh10+U4qCrZ1qd0i35HaX0stgBr7TrQLri+EE8hOo
	 neB+KSFj0u76Ib/Vw9x/KiKRuKbHqX6rJQdVQnKCXhJmw2vTThIO07BWxEwOU5qk/eqGb
	 N81dEIY66JbiWtRI0tMPyxn+01ioF0lwF8Q9e2m8Tqx67L/xBpM8w2XuYDVo6G0BwS6PN
	 L9YIr5ssWdft7MbV32z8307R7CD7XF3T8FbEj9ne83xWVS68e17k6PG+L0EaMnTYSKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877504;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P1GbrACwDJFLCQ00w48sjT3/YMiKr4B3U/MTFVQ9cU8=;
	b=g+Wwe/+4MU1NLllbsTq7NngdzmuaBdB2HREtEDcVfydYJtjPbdzT/wwYzZZ8DUGLMjxB
	 1gin9+c7Ldkcx1tnAo+zrZpUjQeRCpIlcqdIykHUKo8jO3tDZadu0nZByK2+0HHfJzoxo
	 1zw8zFuGNUYaAboA+w0lNBpfI73pkHY2QBqCIi8ZBbwEIhpWcKJ+r2b0oyD3XAWZkC++J
	 uTNd6d7IQaRmUTqt7yNddfdyptjQpjk2INZosCsDxUzgQotJgewXQWCpYEnkk2nVjf3Lm
	 BQfynyeUMDbGvp5TKCmWHWErtaYMMQtKtVn7h0xiav2HDfm8Xoj6q2QrSh8e2RdxFoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e6X67APH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A3C606A332;
	Tue, 17 Nov 2026 01:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e6X67APH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2771F000C6;
	Tue, 17 Nov 2026 01:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877504;
	bh=P1GbrACwDJFLCQ00w48sjT3/YMiKr4B3U/MTFVQ9cU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e6X67APHkqpxvINqIFMPGoNU+Wsdqe7QScwFqn30wo3d9irGn7GEns0YozCHY/cZw
	 R/oh48MT/xswmMPTTfdkOH07S0z5EN1uTcQC1PsJDVEcP6oN2PboT0nUkW1xiTTLIR
	 Ug6Rx7phB1R/6WBvVH38iy7Ymt+80RvTfVSIbv83Vm/c9FLd/N6R6z4M2TlbEt/DVl
	 6/faf7aF8skowd0UuSyU0sV3z1+UzZJ+6F3/X9W/A9Fsk3Mx74rGlUMr/1dWS2CRnu
	 1/j4OXR9FoFkbb7qPpEu0u8EPK/1hLF9ncYb07E4wP2lTY7G/QhhemIv+Z36SLndfW
	 N6A1Q8zkj8SXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Joonwoo Park <joonwoop@codeaurora.org>,
	Imran Khan <kimran@codeaurora.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ilia Lin <ilialin@codeaurora.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Christopher Obbard <chris.obbard@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 00/10] clk: qcom: several fixes for stability on MSM8996/98 platforms
Date: Mon, 16 Nov 2026 19:04:41 -0600
Message-ID: <179487749319.432567.7239081834486864574.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
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


On Mon, 19 Oct 2026 16:40:59 +0300, Dmitry Baryshkov wrote:
> The MSM8996/MSM8998/SDM630/SDM660 platforms face several issues with
> stability (e.g. setting running at the halved frequency after certain
> frequency switches, resetting if run without clk_ignore_unused, failing
> to scale GPU clock, etc.). In preparation for scaling core, cluster, CBF
> and GPU voltages, fix these issues affecting platform stability.
> 
> Compared to other patches in the series the patches for MSM8996-Pro were
> lightly tested, as a part of the larger series and only remotely.
> 
> [...]

Applied, thanks!

[10/10] arm64: dts: qcom: msm8996pro: use the MSM8996 Pro CPU clock compatible
        commit: 0f45504f2319e2ba423c7996740746e4fbc8129c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
