Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB2C417D6E;
	Fri, 17 Jul 2026 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296570; cv=none; b=SWc0FlVu+TabrGJ1C1M1RkDx82v/nV3e5MXy7moLUJ9QzxewN+mOUr1AQ9MgO9K1D0Pn5iyfTtQEL/CLyFnRLL3Q/GqkZAQ7KWotBI17b173FwV3cm/QjfjR4GsUldoG94C6Z9Od/v/6ugwYGnLWJsOCiefThXkZorafi1MfnaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296570; c=relaxed/simple;
	bh=VzknG6bu5GyNIajsFcQXasKy5FqWpeRcQpGJezwoO5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFh2yOkHQ4uRbUMHgU3j0KuRQHsBvhPsG5K1RmYEcthN4vI9FKVENaZhTKNbYFnIy5/whUVUe7dhxFYCjKuoL919p9MvBk56I3M5pIHWRUaPyGcdW6iAK6/7B8ubpNsbROft8sGlMzM4qPHsH1sGWn8WDYOBwjpz2tww9Luiopw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xr3v0Mr/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xr3v0Mr/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1761F000E9;
	Fri, 17 Jul 2026 13:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296569;
	bh=TtOURXpd31C7HKu1aW6O0V01W5j1OYbvK0lLANhiC6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xr3v0Mr/8Bam4zcalsN9+wfe2WEPuYpAl/SuZAXc8wE7BlXg4KCeXP3SgErP0IDLi
	 5m8zXMkW4AOII65WjjdRenMQNk3cRoDjk4+VSklCgu7pM7552HShZcc5k8me7NUBmP
	 gj4LXosJo0tTuLmgqG0JSjjaV92YMjJ2q+CjenfV2PW4V7/fbJOLN0nQjMYQPRz6B8
	 OE+mlswkr//6r2hbXld2yh8i1LRuHEd2TWEuT0Y8kuYmAPNcIQAO7zFnvzYyGkq2FC
	 O9zbMV29CvNJ4f7x99K+N7hhrcBBHchsekOlBx9NjD5Kdn5267RMEWJ4aXxYozG9MM
	 XT83Bs6Lgh+hA==
Date: Fri, 17 Jul 2026 08:56:08 -0500
From: Rob Herring <robh@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra
 AudioCoreCC and AudioCoreCSR
Message-ID: <20260717135608.GA476084-robh@kernel.org>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-2-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-shikra-audiocorecc-v2-2-b320d822cdd0@oss.qualcomm.com>

On Wed, Jul 08, 2026 at 11:55:06PM +0530, Imran Shaik wrote:
> Add device tree bindings for the Audio Core Clock Controller (AudioCoreCC)
> that provides clocks and Audio Core CSR that provides resets on Qualcomm
> Shikra SoC.

This should be 2 schema docs. They share very little.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 90 ++++++++++++++++++++++
>  .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 ++++++++++++
>  2 files changed, 139 insertions(+)
