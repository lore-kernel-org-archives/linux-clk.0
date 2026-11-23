Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432184;
	b=tjeLnCKvWTIornNxySffZAkeJ5ODsUWScz0CDTiny+MggK87AEVivylWRbx9UmLYRgXV
	 F9t4YKZ4GN2+RZlZLV6lU7D7XjXeJtcP+PmH43t4Vd4e3c/rIy+hN+wT8QCFxWk30xUr+
	 0quMITtOkisebNfQYPnFaGIrs9bRXmtDh3noHLAXvsSl5zZoebLIn20qXVOr6w9uyEQKj
	 ef7NtYq42jZHN8V0E3ld2NJtpHv2NyPPpDKmPfjdWe8IRGXFCXwuV7ziTEOb/Q4wioF8+
	 9C8AoMz038yQDReMBrqtsOOxiXJwmAJVkawVuzzJC9NYdGPD5ZQnI11GfLqMr2Yyz2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432184;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=m+1rbnB2XIBoFek7YSMPNC4SvTChDO6N1k2EZFgPzuU=;
	b=PUqV2uWd6HQdcNtlL46U8zYoKSLx+2dXAIGDDQ3MnR4f0iznB1awbvIckjsuut8s3crJ
	 7ZrTawYSS0HgOdAQLX0s4H7/z683g3xW46vtSZor+1VfjE4aTqFHr3OU5hMrLJIsTUABN
	 seAJiea2r7SGErOiAlW45Fi+hAEYtTvQaPzIESEm6+Ri4HJy7dyWv1ntOiary5k0+kv65
	 pt/EUjrIdA3kmhK+1VUNey5o/v0kr0LlZicDgRqkkN0Q1LMi1TGpNAqXRx302XKq+k9Jc
	 5p/+DORmUCcP0rly6SM0TfsxG5yaFTZdO1/C+35STAqw76s2afVqiC+eZWUFuT3u3WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nG2Qg8F1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466AF606A31E;
	Mon, 23 Nov 2026 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nG2Qg8F1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E90B1F000D4;
	Mon, 23 Nov 2026 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432183;
	bh=m+1rbnB2XIBoFek7YSMPNC4SvTChDO6N1k2EZFgPzuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nG2Qg8F1X4MpHPPC4Mw0d880qgNwOVR464jpte19mccsajr+UolGrfi3Y0me7cXQ9
	 T94Qk25Zw1mDjn3tu4HA/Tvx/GLFlc/CKzH3tH3LExzcQ6wMpiG73FS8b192uxuZU0
	 YX4ApsT0eq4SLnTnuiRclCm7hQsbeQ1gTTF6p9+z86QCPJR7j100VkFSyjzPnlACnz
	 VoEW4Ehix537kntvXYr0RaZ1YY88VBMaIUNKmBc1JbTdgWLUcHDDS4lpXGBN7vV2hW
	 HUIlcBtSpbduQBU+RriJtGFLJrpx/b6iBMN4oSbqrOpaRurpis9xuKMHBDSc4B+cao
	 p1HwTz9DjFXMA==
Date: Mon, 23 Nov 2026 12:09:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: add Shikra PWM XO512
 source clock
Message-ID: <20261123-chubby-nightingale-from-tartarus-310442@quoll>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
 <20261116-pwm_clocks_shikra-v1-1-55fc11501821@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-pwm_clocks_shikra-v1-1-55fc11501821@oss.qualcomm.com>

On Mon, Nov 16, 2026 at 10:57:44AM +0530, Taniya Das wrote:
> Export the GCC PWM XO512 source clock ID so the Shikra PWM controller
> can describe and configure its complete clock path.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

