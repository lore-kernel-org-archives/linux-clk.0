Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F869257452;
	Mon,  8 Jun 2026 10:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915800; cv=none; b=odcsk+FcpVreRVGDqBpYcQbvovPCziz2yVuCQT/R5KR7hgZ/q1AGnXjMw6rOyd0VhppFbjR9/QxrFu+tdorlPEcsY3if0K2jpb0TjkubpCPObZBMdCZI0abTZy0vi/mxK0qCjnfUa9ZIpucLRKqN8t684go2Ii1accZqfFwnSa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915800; c=relaxed/simple;
	bh=TgZOcp+iFLyRNDHRgEgDH5b56zLWoGs0mQCuL6FJ0Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDNAIm2NAqPdkyhhBE05ei5pKMLYHmn2sfYcmF5oe8fa++berEmowDZBQoZ+C1++W40jIH+tkSwlZShXl9Z8RU/2HnLvUCUux09WVorBHHWEcgyvpLyX1D9mXfUpjRPKPRlxIWefBALLc+UDwcfNjJtuSNyA2AxyD9+CN7/Fz5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwK6gkCl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwK6gkCl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7B71F00893;
	Mon,  8 Jun 2026 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780915799;
	bh=jsumRobjSohWTQpwnHB0WvPFkGiqjZq7WYyNasPTipc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OwK6gkClry94Qq+PYrRXOAi2ShOAuEtX7oKSWr/A3ER1ZzBKJr7pkhBgfK7UXOTZA
	 E+10LQORgc+b+IQN5TC9DLwphcplNs9QGHeu7SHBZOKYBXuL0HQqj6LmFtAYquGTKO
	 hakmVIvYjVdDaU5VYq8XhJ9/0kZtgI2n86bfojRFu/YIFVImc4UkEPYkS19LlZLtU5
	 S5FqKLlS5DSR0B3V7vl1LmKIzP/j9WfZuMJk/s268bIbqRmAV0U4EwphMca14IaWR9
	 Se5r+gHpNdXk/oAWTO4e5J7h0VcpT4KOGewFVvk2ySRjNR0/g/dkTitMMTUv+0+5H7
	 hyX7qK60GTpew==
Date: Mon, 8 Jun 2026 12:49:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
Message-ID: <20260608-snobbish-kakapo-of-dignity-f7bbff@quoll>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>

On Fri, Jun 05, 2026 at 04:56:31PM +0530, Imran Shaik wrote:
> Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
> on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
> across variants based on Audio subsystem enablement as follows:
> 
> CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
> CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem
> IQS: no clocks/resets needed; no SoundWire codecs
> 
> To handle these requirements, variant-specific compatibles are introduced.

No. These are the same devices. You do not get different compatibles.


Best regards,
Krzysztof

