Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62173382CA;
	Thu, 29 Jan 2026 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702864; cv=none; b=gAHZXXp1MbLnd5ZbDTQUpd4wOffKEqqOUkKnPewQkJb7odnKsqk6XGi7IldIwUSNhjzOdCEetadiNFeVM/OxyL2+sJzp7vXI2AwKbFhMQkxGO8WwiZf4BT96qZqO3cx0Ewlt6EZqs9dEXaNEqlIFGsvqR2QPZDLYBMAl5Aol7S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702864; c=relaxed/simple;
	bh=edyDpWccp+SyzVe8nIG32V3ZrXLEdt5h0WZKlrcY6v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0iO8Ung7wViRFfX0vny9rNfGTBR6LHMI0YGKB1ypttZgpw788+C7oaa51YCVYcDD0uKKDM/oUlCGci84AItZKH24o4PuCVdl2zGK+PFZ7eSbiZhssK2KzB5T+fcOsgaEMWGebRP1D1TrKi2Fuv43ohOHRhaRF1UEoe+AUxNa70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCdN8CbR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCdN8CbR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC0FC116D0;
	Thu, 29 Jan 2026 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769702864;
	bh=edyDpWccp+SyzVe8nIG32V3ZrXLEdt5h0WZKlrcY6v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCdN8CbR5l8R4WunQ7GAUxr3QMfkZwzToa26q1AFrGW7T76dNbIP3ei9J7Jk0i0jX
	 /7CvviOfsV7Y5E8j+WTFE/pfHpIp8Zn0HLi57nliQwgxTxYDZK2hYcf+poBntKM56R
	 dmTLBmGNNK80aA6AJdW+iTYFqnnA3s4kCEA3BnRFwVik5mN5yOxJ3PIdDK8WFd+6u6
	 eNbZpzPwEI4tvpDeoLgZM9J/5QonjCfbBICBqz15g9LPR6t4b4PfQOKcJ0HNbhSyW7
	 v4pS7V37P1NmH1q/8AsoJJ52KxoXidUECYyMBZghYuo8756OsSFMsVvXB9HX2ItOD7
	 WdtBrRo/E8r3g==
Date: Thu, 29 Jan 2026 10:07:43 -0600
From: Rob Herring <robh@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v6 2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
Message-ID: <20260129160743.GA1117034-robh@kernel.org>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
 <20260126-audio_drvier-v6-2-99e350855bc2@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-audio_drvier-v6-2-99e350855bc2@amlogic.com>

On Mon, Jan 26, 2026 at 06:01:43AM +0000, Jiebing Chen wrote:
> Add S4 SoC tocodec compatibility support.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
