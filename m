Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566033;
	b=f7n8B8sRN/nPrZ5bwo30HFF/lWbPSYgDsIKV3t/IVswwb/hBITeh/SBjZ/ITvXsWXDuP
	 h56VNpthWTnywQAE5UduR5YVD9pxWjBpbJL/zYZUCWPRtnVLJ+tlUC3r9V+ZQb+X32P6b
	 c6ODpnRyK3Si/R/Fzt4Uvhm6dJxqmFUMUJQX6BmZtaZA+Jtj+A/M+fDMpzRL/W0NJ9pqU
	 vGQYan44GLrY67cb2pUTvfJKwf45T6yNZ5s0jah6m9WOvL63eoD1xZ2M6+8gqNHTmHEd1
	 EjM3kqmstH0bwUwyxoN/0sd2kKh94/paT2UBm32ISX6j0TQOLDL7E+j1OU5sqAeqmWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566033;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nAAFN+kL6XGhKEZD2gSfH/OYoLpix4o1w/mgKhSRkLQ=;
	b=UMAMMWs63UxW9pFGHo5HWgGr8h+2Q96uDeKmAMmJ/HJoMwPBv0BlPWtUwB0nHZX171ix
	 LjdgOtY4QgF1qFgY4/hgLh2Nbd9yEwsBVbEfzqZeBkkd0zcrMDpr7AWKGtSaX9e2D5Ern
	 38985XaozByiVMo/LZZ9Cnw2D5gqLZroiWYYxrFqII38xz5SwCVwX9R9ZOmGyyQi9h9kY
	 ymVOPK5XjwATfK4KWXSOoGZa9Z0fWy/T+V7NlKbWimhFpLFyEy36eALfDww9roP1ywuYT
	 /+SeoyLtCTGaLYB2C73+hb27NrjHe/PDp49PLPBHBicm6nsIH2zbwb9t7WnVtOxNVxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V7gOJf2U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC4D606A31C;
	Fri, 13 Nov 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V7gOJf2U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3251A1F000C4;
	Fri, 13 Nov 2026 10:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794566032;
	bh=nAAFN+kL6XGhKEZD2gSfH/OYoLpix4o1w/mgKhSRkLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V7gOJf2ULdroqhBcdMGkYE3PPyOnjFBbK6WVKcCn6xdNxvMnajN3kBDa5CuamsF1r
	 f+awvpW3r0BPaGMnSMKwjKb91w3g6lBMfbrbJEo84lRZ+3KDrTSM/bFqnFOsX7KW+Q
	 uT3POWzPHh2eK7Wt6UgiztzDgdSqf/gUff3GzrOwac5xA5nspcXKEaQ/iH65r7YXbi
	 QGK3ezjpSWv5pvqsaLbA7bLhcBUiq/z/oV+qHzid5yoJpb2x+acL5xaHc5GMkzSHyH
	 jWOTUENKrsxWk9xACDwXSnYwsllet5Q+7TkJUpgiDIDb2WVHdu/3GDjDa8+mrxjt/e
	 WRQoy0BoYU4KQ==
Date: Fri, 13 Nov 2026 11:33:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: document the Halliday RPMh
 Clock Controller
Message-ID: <20261113-fast-red-mackerel-2faaff@quoll>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
 <20261109-halliday-clk-v1-1-20c3ba8be0bd@gmail.com>
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
In-Reply-To: <20261109-halliday-clk-v1-1-20c3ba8be0bd@gmail.com>

On Mon, Nov 09, 2026 at 12:29:10AM +0000, Stanislav Aleksandrov wrote:
> Document the RPMh Clock Controller on the Qualcomm Halliday SoC
> (SXR2250P).
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

