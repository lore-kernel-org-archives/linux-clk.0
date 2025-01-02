Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E698194AE8;
	Thu,  2 Jan 2025 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735806366; cv=none; b=q1e9g7yB7iEge9sb0+zEFd9YxlvoQ3asbRqxcOhtUFkAdf8s5ZwM7KrNSncsVIYNmpOgyKqk8UZ+KSoss6DG41CLGhn0PodT6Gby/XwX0vGCB1RwfT/J0ngZZabhHQ/p8SkdtLiqpNBj49oouoFihs8eC9nF0fKqzqgbwTjCelw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735806366; c=relaxed/simple;
	bh=a/jkkhb22rDc0sD75YrgckrNRNFXB+uJYJPu/qpNb34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxJB7t+B/6H+Qyzf+Ue8qxRUQTn6iA9nyjw/pHRaXWlHU0UJKbZtMH5WL6AF8ZALEOdurt2AU/ZtNSZ96E682ffFAz0wrGhMyzPcFqeBorw6WHj0zPAQmOMOwtcQdqc3Kp3o5z/4dzJhilSw1tdV4606QFEoNu/DVbsJ9ZC/aTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJIduz3j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJIduz3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E9EC4CED0;
	Thu,  2 Jan 2025 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735806365;
	bh=a/jkkhb22rDc0sD75YrgckrNRNFXB+uJYJPu/qpNb34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJIduz3j/Mgsc+RQLc2lRQPnBT3B2RDVJm/v94aXsLOaj5plXcXia+0kQ+H0BoGo+
	 g9MA7qg0yRsm5cX4rTyksx67XUKH80Tr17YM9IWqKUKyAkJdR3HYgy2+7vnQnAqO1w
	 tobC0mH2jpwTUCT+Afehy+yopQeNNPqHXbPzGvY4d6/kLLWzVWFfYun/LJ1rr7kwKn
	 UgI3PIeztxP9Il6HKi5qfFRzwGFSTl7vYpr+VVh6eLA3kF9I3wV7M4OOmNZ3oup/xu
	 k05ZAmB1jN4UhvOsAe33F4RKoWOHWYYqLga/nYDdYgIA0K3G1UI8bGISk2LlvS9COX
	 3Dwxc0Ntoor8g==
Date: Thu, 2 Jan 2025 09:26:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] dt-bindings: clock: st,stm32mp1-rcc: complete the
 reference path
Message-ID: <gtisijd2uxatrfu6yppkv4zeddilmsxjoqiaugxqregfyqgbed@4dryamubwyqx>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
 <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>

On Tue, Dec 31, 2024 at 04:01:41PM +0100, Dario Binacchi wrote:
> All other paths referenced in the file follow a scheme starting from the
> Linux root. The patch adjusts the single file that deviated from this
> scheme, making it consistent with the others.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

