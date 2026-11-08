Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169344;
	b=CgDrlqq7bP4egXmXmitmLsi7IUl8G1pEq+OSEJbmJGHz1mEbKzX8ktiOhlsg3OjSGbpI
	 cwVCVcY8LGlyCiyxbFnkU0BLm+lfhv83WxhalRqK783XGnJNdWVaCbHVJ+KtBHNYUJwKG
	 gUJx3O+v35zZumMS0vNYrgwzYOqe0FaGpnnZW2M0BHmHH+YVZvL+RiHdKBsqB0xSxtc0D
	 N3lRp+6Su48CI8qeJcZA3BQEP84UF/GZX/IB7PVpZcK7Cr4QEuhrMrQOspeS+zJ6+jRkG
	 G7u6j7H/HMDdNSYV34wsPwr/EKSTqRRdJFtDPuFfUGCqamVlUK0jMHCFkwTnyaMJaYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169344;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3MmlJbhMgYnjv2Z5ss4zi51X86Ma9IpJAikJUbBssGo=;
	b=sm6N8xCSKuyXIy3VoQxWMrCTVY8jd/+HggTDjHBPdwezsLjq/+aRUYzcVESBEkRidb4i
	 ixmqFGurfb0nP/NPtPgEivstH/eyo7vqe4IWBezrCuwKQr7kAZXHpSz0V6hdtm0nCEeRh
	 fP0L27SP3wJDyXkPXdISB1/qSEIT9pU0qA8ULCSkyzkl1/O/6RG19xQUNEhz1fCHuPRQs
	 83GIIU2JgoK5DSz4S9R00geeO418EY+Kz/MpFS7gofa185Yuarp+tgHYsB3LuerJwTMyY
	 N2jPAdCwCl1J/HhSQnGuNzXreQM7ZFtaZklqViBaAMbsWl7WdT3sV7sZBqRBbLeMAYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuzTxB8v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0D660A262B;
	Sun,  8 Nov 2026 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuzTxB8v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE171F008A2;
	Sun,  8 Nov 2026 20:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169342;
	bh=3MmlJbhMgYnjv2Z5ss4zi51X86Ma9IpJAikJUbBssGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TuzTxB8vfwJGfG8ZQdBqwljbWQ2hIfXfz7iVFR6voCf87fnRYT1yXk0kTOLSS47UY
	 RfC9r1RPoTXungPBjhJaokK4lbmQtIbGas3T+sv9bOkOWmXfGCcx05gvUZ1p369dTm
	 cHzFRYHGiA2w6ljNY3Oxcn8THl/rV8A6KHE3/vb2uNaF6CWnJmpLR1X08Uf8xIPG8n
	 fm+OZYP/hq8TQj2npvX+/Y9UXEzc1UezcS74U8LvS46xLtBU69s8ke6uzq3uEPD/Ai
	 A2C72ocMwTFso8rxCK9e2B3ICh+2Qd90trTcQiWZhmkhakCltBChaJ0I9nuudRpRGq
	 3nGnQhZFZjLLw==
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
Date: Sun,  8 Nov 2026 14:19:33 -0600
Message-ID: <179416929428.628393.4750344447812745307.b4-ty@b4>
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

[01/10] clk: qcom: gcc-msm8998: leave the GPU BIMC source and SNOC DVM clocks on
        commit: f9915d2288cf906340491247b88e56ab9892c97d
[02/10] clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
        commit: 0522f2e9c8c46e1f826886ee95858384fb54aaca
[03/10] clk: qcom: gpucc-msm8998: set the droop detector bit in the right register
        commit: 0b744ddeef0eff0c5e83275035317bf0e06c04c6
[04/10] clk: qcom: clk-rcg2: forward the gfx3d rate request to the parent
        commit: 1681fb3aef162a7396405528dd058e2d57face2e
[05/10] clk: qcom: cpu-8996: move off the ACD leg while the PLL speeds up
        commit: 69ead47d97b2b9347772d9000f33fc2b39d4601c
[06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk always enabled
        commit: ebd18af72a5cbb2073829eae07618fc8d6e460dd
[07/10] clk: qcom: cbf-msm8996: program the MSM8996 Pro post-divider
        commit: 9be0b69872794cf50575ca7e35787a876372d15a
[08/10] dt-bindings: clock: qcom,msm8996-apcc: add the MSM8996 Pro compatible
        commit: 3426d15c47dc7278796041ad6d443259f48a8dbf
[09/10] clk: qcom: cpu-8996: program the MSM8996 Pro droop code register
        commit: b044374a1e38cae42d322e856167e3447505b304

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
