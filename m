Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C85438FED;
	Mon, 28 Sep 2026 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589557; cv=none; b=uO35H1MuJ48FHap8EenpZIwol/iAt6KQLX/uy8ElEExt87NxwHNQY1UQXwUkiBecrxYi2BZYa/eScAIQbn/JjB4Z98ygrCVwXZYkvvWu7lysm3Raf6pHYgMZrYyMFwIwq4SFGZrLZE4o7GWlkV0Zk2u68XEQe/M+ttJVJpfqpMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589557; c=relaxed/simple;
	bh=tDm6FJX9YO4/8S1CJFAHjUUiEYNhviwDxS8lxUvjvjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCrg3clj5j7UHMmMJhus/b2zeC6DZ4457aFFy+m4EDbMxORmc8kSdY4AH5vVihlGdZCjDCILWpijok/OqMIygLxTsjOLPAzhhPOgkYtlvgZW2ya113xhO1wqHwgBoJN4BST2kGt8pWZx/RKtqX2i2S5VkRjPwvseWeR/FjLGSxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llq5MN8e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llq5MN8e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8011F00893;
	Mon, 28 Sep 2026 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589555;
	bh=TIcS9AjgLyMFSTOIjgjZvJXhKb0Qgf0rfSzZ2QDpdEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=llq5MN8eXxRfaFo2lV58Fs5mYWyF+6NdIh6Sei47Y7en18nVjDnauyHmAGMHb4/0O
	 zgpvy/XhPvM8v5bAQBSpbM8UzhZSYmlMdusBfZi8CB4eaP2JTfPAWrR0BJl87MM/Ey
	 LZVNUhso2nYNRRJVugA3y9ErVwjUeVOmxJ2noikWXNPj0GKttKcY9UW2zXS0OMG24E
	 EibDFseKmF5f+gsUlfVKsv+123k9RgC9UK+m+vIlX5galFQm9jjmmmymd3F0cT/g09
	 KIApAwIQkFRZB4XE1YWkEAf/OErQf7A0W1hO+cAprxfxfP+B0Wc4Pt2TGEYIZx9Hrq
	 No5GWGbp5b1LA==
Date: Mon, 28 Sep 2026 11:59:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset
 controller for Glymur
Message-ID: <20260928-nonchalant-mindful-goldfish-910c9e@quoll>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 07:44:22PM +0100, Srinivas Kandagatla wrote:
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm LPASS core and audio clock control module provides the clocks,
> +  and reset on Glymur.
> +
> +  See also:
> +    include/dt-bindings/clock/qcom,glymur-lpasscc.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,glymur-lpassaudiocc

Binding looks exactly the same as qcom,sc8280xp-lpasscc.yaml. Just add
the compatible to the enum there, no need for a new file. Less code to
maintain, less possible mistakes.

Separate header file for clock IDs is fine, though.

Best regards,
Krzysztof

