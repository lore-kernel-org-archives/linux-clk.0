Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C730D3A6F00;
	Wed, 12 Aug 2026 20:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786567862; cv=none; b=flASX/AKBtq3Rg46p1U87Z0SfE+ZhgqlxlQ80AdYYkiTIBAXN7eIxz2Ra4mjZwqZUNeEwS86aTqlQyO76ewovvpMNGeEOvgdXmn/u3sIgJxq9JzErv9COEe3n4HH4zjr7K+t5rMxysC5eNsZy8Aj4iCg50pMUVXQlDBCFrTk4nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786567862; c=relaxed/simple;
	bh=DGVdyBFPVJ7+b028hudyXKU6gQ5fHSJaaj2NkSFAzkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGR31WSEo4sV6fPVRkPqDGNdQ/UEpF0p5JA/rxmigDRsTwg3Y8Wf9fkCI2jg3qPqI9VH6rJ9R0YMFG/GpXE7Id2eqD2CmT5/jpTh1UBHQfJwdu8ealjb5aFI9MSIJvseGlNDEfVBDlNE1F5ANofdIjzSUnSYltm2viHNO9L/XeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAuPpK9r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAuPpK9r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1493C1F000E9;
	Wed, 12 Aug 2026 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786567861;
	bh=tVJCQZxVeHQkB6OTtlsDBa53lFmpzbh91NLfpeM+XQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EAuPpK9r8/PyF0L2pyWpFgRptVavHNmlIu9+Fu8eUJL4n4iMmnmk8auaBxFWEzKvV
	 HfupHLur0pEEV5Lw5jX2EMKowl2qWXlfPizLX9alLGZDb8jNFiQ7I0DKxL74vbeNKv
	 RbssIbY5p3CTXpufM3DLIXSd+8fq3ZntvkPsrtj4fbk6urjycxdBAQbVfUmfWvbXAE
	 EMqPWsEYsARhS5DnHz2rnyYNPLew99TRys/sd39lXtXs9FaybyTvkCC2TzzJTZBGkH
	 /S0hDiJNKCE7PCbJLbUyjGcFEAZWccHKxX3IrrBzKf+oHk3QDLWVksb9iMNViCBd/E
	 SI4xfnZ8xM4kA==
Date: Wed, 12 Aug 2026 15:51:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org, quic_suruchia@quicinc.com,
	linux-clk@vger.kernel.org, quic_linchen@quicinc.com,
	Stephen Boyd <sboyd@kernel.org>, quic_leiwei@quicinc.com,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, quic_kkumarcs@quicinc.com,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 02/12] dt-bindings: clock: qcom: Add CMN PLL support
 for IPQ5210 SoC
Message-ID: <178656785983.964931.11187657575515601441.robh@kernel.org>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-2-cce718b8ec17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-2-cce718b8ec17@oss.qualcomm.com>


On Thu, 06 Aug 2026 23:53:06 -0700, Luo Jie wrote:
> Add the compatible string for the IPQ5210 CMN PLL clock controller and
> the dt-bindings clock ID header for IPQ5210.
> 
> The IPQ5210 CMN PLL supplies configurable clocks to the NSS (network
> subsystem), PPE (packet process engine), and PON (passive optical
> network) hardware blocks. It also supplies a raw EPHY output clock for
> the integrated Ethernet PHY and several gated fixed-rate outputs to
> Ethernet PHY and switch devices.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
>  include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   | 30 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

