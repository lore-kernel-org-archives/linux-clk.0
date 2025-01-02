Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2721518E35D;
	Thu,  2 Jan 2025 08:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735805092; cv=none; b=WaKBVRb+b0F1XksdoE/Jvp8ihUuS/E+bRp8kqqTsZu0ZR8i4q/9W4JtKvNoZ3efDBnQQqeKLDNHaYrpHzRXbOBs//4ya6ukGTeTdQxi4ZCopcxtcsNLug24D87r8TpJRD70XYtz1k/CLvitaalNblJSrPfRDwugTQaRGaBWvS0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735805092; c=relaxed/simple;
	bh=fqSPwiW9TD2aNHcdroIetu+qu+4AFiuYwOjG9zv2Ckk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYFYlOZJRbK6T8eazan5vXd885vq3YzWlLjS+bMYqoDBaBjaCp/YRWTrd/EeqXNlb4w+g6ryEG5kpdLwwI51/nJTaCz8Lv2cu4bxsMYAd6zRMyu+xnPSDP9dGyADLqcmg1rV6PuHK8YC2/CrJ9C3RA3LGezHIknPyptyxJSrDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiR619ZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiR619ZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB99C4CEDD;
	Thu,  2 Jan 2025 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735805091;
	bh=fqSPwiW9TD2aNHcdroIetu+qu+4AFiuYwOjG9zv2Ckk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qiR619ZTh/mk8vVWSQVEmrWfHJwDEsFYyQWgrQnBDaSIfExWM88sANFBMKVwZkHuw
	 aysBPxaURggvv0+m59JsewxDISbbT3LWMelJYZcfml0jPEyBOFP6goJdPOXvAxNGV/
	 h0kyOlZrBHn2qGCsRXY8pTFmdOoDsUN0iMssQ2P85DheoBraJUOBKP1sw82P2dNfU3
	 ey7WQ8FCI/KAAs8heNt/UWAEaNSldKP8qinL2tin8oU9adCTo9Eixr4fAw9GBjsTxd
	 Lk1Ki22IbJnPMw/sREbOWFMvQmcYR57+VxJ2QHNUxOrdvsHCvPxITTrH1ti5WJykgh
	 6U7n4nKC+YgyQ==
Date: Thu, 2 Jan 2025 09:04:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Handrigan <paulha@opensource.cirrus.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	patches@opensource.cirrus.com
Subject: Re: [RESEND PATCH v5 1/2] dt-bindings: clock: cs2600: Add support
 for the CS2600
Message-ID: <o3v5xvn55r3candka76xtt7ixze6g7chs74xkqcrwlvdeqoygt@mduvhhj2o3xj>
References: <20241231202018.3956166-1-paulha@opensource.cirrus.com>
 <20241231202018.3956166-2-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241231202018.3956166-2-paulha@opensource.cirrus.com>

On Tue, Dec 31, 2024 at 02:20:17PM -0600, Paul Handrigan wrote:
> Add device tree support for the Cirrus Logic CS2600 clock
> device.
> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

