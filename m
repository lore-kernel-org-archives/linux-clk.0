Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66684494824
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 07:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396564; cv=none; b=lptiYmqklCiyLXEm0JXRqWoA+GiNxnWx3Tn0ASkD1HlffRDt8j5yy/l8Tr6wmZ+rvyRI9Xtxa9JNhdlZ4vVZAhVF1svbjRuCNjC3Rg5URuT90M6mfbmn42A0bSifmvV+YZ9b3Px+5hZv5paJvcB+eqQCImwvBlrPSU7Rzty2HRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396564; c=relaxed/simple;
	bh=0UsQ3n60E97BGa2HlTROTrEG9CwDCmgVJdoridH2KxE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTzZ9FtKMgn8AxTnc30viaalAjhKNsZIi8RFdGr2oib6B4OC/sO1F5z665TgK3bxaaLgz6oc6xU0iWj6pVY86uFbZ0qrMTsyq7sbvmYdUD3KMFBEYgoYIab+rRkps3P5C4ZI0WUfKtEWbZw8KQ3ICb7snrHQb0fWqZof6DeCN6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcIg45gj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcIg45gj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5C11F000CE
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792396555;
	bh=0UsQ3n60E97BGa2HlTROTrEG9CwDCmgVJdoridH2KxE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WcIg45gjJPO89d8/3nYqpS8ZsQ1qJHg7fsyu6VkP2Bvh0PG4u3Yz/NT2RpJzTRLdf
	 IGBg/vrEqmAslMw6j79Jl16Q0nnIQIe+wJ2MFZ6ORBEn+2WX1A2CRJJGs+fFwSGsS4
	 I3VMSK793OTAHM+E7prAJd+jjIx0Ig1OR4oac7z2p8JZyOfqTX+IXXtK3sG9tzKh+m
	 1Wr7Jow/ViUCJlu2SsUQ0EKO/j/i24SE0qowVmSuSQ14NMoJT6Tig+vC9jBq79lWse
	 6d0Ul+6eNmqgWqZXil/2W3y2mdRLwGHq0xCLeJ3An1YHh0OOH1CahbpcXMat35Yii4
	 lvwflv5b1c9TQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a9e87ba696so12250651fa.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 00:55:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxbaiNJmZNuyOuMQKNse9y+EvRZTqNPCfB+iSth9v1Bb8B4EPTCrf+Vu5AwN4yxeNgv3K2cR7QmLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRLtCOK5H5KMu0aAy8B3LQQpfBrh/aGKI6XIHbavZGpxGRw/0w
	fKRHxmlEf8TAGj6iEQ/63RW+ix+MH8pRiRdKhTSIfraOOIQNe62rkc+W48Uk35FJJZ+5tjtZj+6
	s5Md7BoKwTX0GP8uvPQL4yRaqG4MRRZT4v8NyCUbHMg==
X-Received: by 2002:a05:651c:54d:b0:3a9:a20e:ecf6 with SMTP id
 38308e7fff4ca-3ab292fbe8fmr16672011fa.25.1792396554505; Mon, 19 Oct 2026
 00:55:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 00:55:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 00:55:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 00:55:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=McuN-mMYa-VDNgkYGh9rHTaVDvsWiCjxtET085dmpUGqg@mail.gmail.com>
X-Gm-Features: AclHuK8slSWePaVIYeJDR5VtNjk_N9b9g2jdnzeLVp_UokRZoC9_JHQ0m_2QpDE
Message-ID: <CAMRc=McuN-mMYa-VDNgkYGh9rHTaVDvsWiCjxtET085dmpUGqg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] qcom: videocc: Fix sleep clock on Glymur/SM8750/Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 06:58:13 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> The video clock controller on Glymur, SM8750 and Nord has three clock
> inputs: the board XO, the active-only board XO that feeds its PLL
> reference, and the 32 kHz chip sleep clock that sources its sleep clock
> generator. It has no AHB clock input; the AHB clock the controller uses
> for itself is generated inside the block from the XO input.
>
> qcom,sm8450-videocc.yaml describes two inputs for every compatible it
> covers, a board XO and a video AHB clock from GCC. For these three SoCs
> that leaves the sleep clock input undescribable, and describes as the
> second input a clock that is not routed into the controller.
>
> Patch 1 describes the three inputs for the Glymur, Nord and SM8750
> compatibles and keeps the two-input description for the rest. Patches
> 2-4 bring the Glymur, SM8750 and Nord videocc nodes in line with it.
> None of the DTS changes is a functional change.
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
