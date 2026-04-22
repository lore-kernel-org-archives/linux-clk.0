Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C4306D2A;
	Wed, 22 Apr 2026 07:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843711; cv=none; b=pBQHdE4Eb27olO1v5rPRpqdRwcqpdyT8VilSxI0E68t9iRYOwCRvL/NoGD/r1sjgn7U5kfLeopsRzQl3XMNPelWLjQ2j7ixQQUSdiyPFbPjcy+dcepnfhO0V+kTlRZs5Bs5PcQs4pMspaYNqR2rUCeTRRn7UtV4JQvlRs5arbPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843711; c=relaxed/simple;
	bh=MT6k3Q8ZZzow3nqeVqoJJUPcXBo3aekhSuJbE4SAZWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0iMsSzWKlOGj84JAYSOmFMgn0rImdCcov5h6j//1vKGKxrD5A5DNdHSsHUnZN/jcs7t8IKfrOtacEv49eWb003PhpHb0nK/fQR8x7P6840Ika5v8G/wxJEiPs+62mEqpbXYnuXL8s7NgbeLzmbFGUsr/pXxfKL8SmQ8cn4SKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egXy5pXo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egXy5pXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E59EC19425;
	Wed, 22 Apr 2026 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776843710;
	bh=MT6k3Q8ZZzow3nqeVqoJJUPcXBo3aekhSuJbE4SAZWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egXy5pXoN4WuKrznFtVsH4ww92ARuQRcPkdl26CHQCobtvcFUq4xh3S3D2qqduVjA
	 TuzCZUT3wUllLPSWfdKgpECi2Jf5skgowdLGOQl3myOLuphmawTagzg7762bBulTz+
	 gstzXXlSHJcwdWMU+40hNYdlMgrTyTSGRH4RZYhGsr4mIGB4R2TQVwYtvWTjRKQpVz
	 VJvjCmHpwHoIOPuSnL2B7SHgZpPaPEImsLu8mczwywH5W5uH2jGr560IdGZOrc+Q1K
	 4Jvzci8+XPJIs40oyuqdQGI67bWsBiMldkRRnZiS83UdUK/aMtcPSELswxa5KipI7i
	 Br3vc6qB3RzCQ==
Date: Wed, 22 Apr 2026 09:41:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add
 display CESTA support on SM8750
Message-ID: <20260422-savvy-wolverine-of-chivalry-9ae6fc@quoll>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>

On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
> On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
> (Client State Aggregator) hardware. These clocks can be scaled to the
> desired frequency by sending votes to the display CRM(CESTA Resource
> manager) instead of programming DISPCC registers directly.

This looks like completely new, vendor clock API, so no.

Resource voting or clock scaling is nothing new and you do not get a
vendor phandle to do it. That's like basic upstreaming 101: we do not
want another vendor re-implementation of common or typical solutions.

Best regards,
Krzysztof

