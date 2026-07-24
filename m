Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA722F39C2;
	Fri, 24 Jul 2026 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784874924; cv=none; b=BXs8M0Njpc6XZ0kj7utRKs4qnidesaPZx/Zm6uWPtk90cIsgMPHmcWCzYPeGedOfhUWrEIoANofaa/2QiyKm1EOalJLuSikaWTQVlMsWyW/pG0IYqeaCSxBJ05txKMeOQuKQd7qXjNn3/1fsj4HY12WS2FmsSK9Zew3ZqSOCFqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784874924; c=relaxed/simple;
	bh=lC/pReVK6cBGOftbBsdWoR3cu4/kJTWaNq5vsxQMKOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knZyAQwRMjBSfJ5ABu7xtT5v7tl3kQvoJAD2oPTeQKvdj3eHbTG/wEEd78isUmhOqHSKkD5uZDTVBpqZZUAhGbKhznETElYTeOQE5fnUjdTOrA0AUh8+QZPQa5UiQIDQIS2Mr9ArWGXX7SGXqph+orzP3dfDIsG2sVXlDrT9L+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Az5wxJm1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Az5wxJm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70FF1F000E9;
	Fri, 24 Jul 2026 06:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784874922;
	bh=vebOfT4QtqZUxQ6aaHO/4SZImwzI76S++L9rke+GV2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Az5wxJm1NzYQtlv3LKiaWbcdc0qPDJyfe3R9yZUZJkD73qee7DvqwUbt7H21hmxcO
	 4II6kd3ieSaZmYTC2gTHRcsCqP4ckDtIfCrHhr5ogiIqtxAuEnPpcs19QW9pfVigA1
	 bNWdWghmHHlby7uH9mE0PY2Uxj2EAuxHTu9AknNdd6RWIzdG2lPMy2DTQKiTuVCTjx
	 +TOYctJDWRpCbK3WAFoRoBA4JxOqK6g784rr415ehhsu7ik7I/fB+GVkZfQbTxkXh+
	 UzVeVwSlxzPb8BwsZgQreZt0UN6Y3BCIIeJi/x077tMpKup+hurzRn/COl4E035wc8
	 KL0vPT+jVr0+Q==
Date: Fri, 24 Jul 2026 08:35:18 +0200
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
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra
 AudioCoreCC and AudioCoreCSR
Message-ID: <20260724-cute-blazing-urchin-9e8cef@quoll>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-2-90b878ae0d4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-shikra-audiocorecc-v3-2-90b878ae0d4e@oss.qualcomm.com>

On Thu, Jul 23, 2026 at 09:15:51PM +0530, Imran Shaik wrote:
> Add device tree bindings for the Audio Core Clock Controller (AudioCoreCC)
> that provides clocks and Audio Core CSR that provides resets on Qualcomm
> Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 55 ++++++++++++++++++++++
>  .../bindings/reset/qcom,shikra-audiocore-csr.yaml  | 42 +++++++++++++++++
>  .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++++
>  3 files changed, 146 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

