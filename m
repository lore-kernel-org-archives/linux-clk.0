Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B81319F13F;
	Wed, 18 Feb 2026 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771401121; cv=none; b=RGn0OYixDRYvMOLpZztqpvJXXnidZDdsysMoa3VQ5iUNDbuinkeL/SMTjc8QBxJePYnfSeS5d8dynwmGOYdawgfmz0dPAE+29/S8+TUy6mQnJlb76Jp8tgJC9CItaQMGT507Jb/+yejCSTX36MtPyPnHnNPT2TEKLfIy8FSa/ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771401121; c=relaxed/simple;
	bh=zjFejVRodD53Cj4OHnhg7ejKH+ALVm5DMoAfOdDAfk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rj1M02BrA1mbJZXMR4Zvr5X51zRSqbTiso7h4Ru2svF5rer7U5UBQX0Bp8ba8jRgb68K+xq9V/+48Anyi7WZe3WLvX1GytrNnGGbR9IZ5FVMZY8PkDm/fZFk/MrS/aTw4r72jvCWIMxon2OEdlUKcRWysjYPp6dl53VpyJT8poQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxYJgFUm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxYJgFUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EE0C19421;
	Wed, 18 Feb 2026 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771401121;
	bh=zjFejVRodD53Cj4OHnhg7ejKH+ALVm5DMoAfOdDAfk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxYJgFUmb+mkT7U2Qfk5X2dwNpOl+28Y7w6x7FYlsbPaa0xS3eeHkq5Vv/rIYnz+M
	 IEXZ5VMJzbQ7m3N7iAEzTCn7fFw/zPZaWJWulwV+U/5Yc1DIv+U9zjLeh2AQavRroM
	 sZjw+9ARLaLZqult3O1Grwzsb4Labbfhh7zRJ70CbW6ems1DgUayjwXGQ/T8Cf8xzR
	 zN6H5Ka90MCtBxvjmBfJRXqQadcYRtU5sWSxRY8Gnp9Bvq8djOypC8VnRA7tQM+I4+
	 qkJZoPgvzLeP8JyhWkAM+JaPjJvwWZuUYLrUxEOBmGQfEVyEzGO92736B1ZmSHElep
	 JhUcPUcQ9pgRw==
Date: Wed, 18 Feb 2026 08:51:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Message-ID: <20260218-ginger-kangaroo-of-sympathy-dca916@quoll>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-2-866f1965fef7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217-sdm845-hdk-v1-2-866f1965fef7@oss.qualcomm.com>

On Tue, Feb 17, 2026 at 11:20:43PM +0200, Dmitry Baryshkov wrote:
> Document the mobile HDK for the Qualcomm SDM845 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

