Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492545;
	b=OmLvKHcsi9nVRWI7hcXhEZnoRW6pjJ5MCYgNPAfaCvLC5ifoQHZS/zUoH0ezHG40uQOQ
	 Qza9MG1yhhAbjIFgm2fePcggBoQnBiT4kfowQscp1eG2u4afOZKmNmvRQtuWzav9demGo
	 9/ZyFQ61O4lJ17n/aU5upJe7ISv6pFAELuN4prkZ5SzZLzXAaeVZnBkOcWxAAC3qXnbQt
	 9+q7j05kSTSEIptp6FrfgtOuQm2xzpm35bKbTk0WyFAlWvPmLER4XHaoeU4vFwpF+yrsA
	 Ls2K/pTs6PbBZRpt9rg2aIaw+P59exGUV5L+faHVtVM1fCrblg1YvUjHEJJeiiITR7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492545;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3r3YK91+4doEhazd+Tla/QmKvzSykFfCA7OhTKV88Mc=;
	b=cZthGBvYsMLY9vG6eop4JyKbBAg+JQl+uP3x1zXr4BeQ6nQBpYhiX16zbBDw79zAHVme
	 S49LI7iLYYDVTFcVXSnbZg60o6rn2oL944utR7w4Dh5q+Yf8uaRjHG/4svMEfFqhDCcwu
	 RGyzeZYzf0is2XTJSg4/fjVA7ebSEb6KO0gv/ps3hV+4zEzL+j8bRmhRkWOKVsUVI0Zyn
	 rPzytCh0/uecgTZTi7ZYah3TPaQ26fU/oIcSHQkg8sOvrg43YIGZIzpbT+/nq8075E2JL
	 fQUOLqRUx0VGo7FoNVYMjnjLDPCP64j0dAYgGJ6AoA1NVNjFJWFuBYydFo3tmjDfb7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jZrKInB/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42EA606A323;
	Thu, 12 Nov 2026 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZrKInB/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82231F00A05;
	Thu, 12 Nov 2026 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492545;
	bh=3r3YK91+4doEhazd+Tla/QmKvzSykFfCA7OhTKV88Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jZrKInB/dw9y7sshA7jXo61/laxLjxtNTGogkJSw4mbYJdGM5Z0lvvgBXztPKXOMU
	 h2cDV1ssFEl1HHKGRP5V45NJEAA3j+/Oxd6QEmEtEtFnk4uPGaArZBYLUvOV6FwD3g
	 JdAj9NqyACwoZDbUYb50924lD3+tZmdiDWSTVHLqGKd/MHfSaVUFBYGThoEvNHy28o
	 cHfsQ5hddnsnmcw/Diuopv9jRDmWXkMOKk4H3DQmBZ2eUq7gJYa6KceOqCmYSLzmKo
	 sHYzZHqfPMPcRdKrOkmAWdZuYgoH7uhzzuVTZ3eoWbgq/6ral1ujjDn0am+NHOY+2r
	 fEJq2rZC0QjJQ==
Date: Thu, 12 Nov 2026 08:09:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: jbrunet+clk@baylibre.com, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, conor+dt@kernel.org, bmasney+clk@redhat.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: clock: convert zynq-7000.txt to yaml
Message-ID: <179449254210.403147.12378067448658354620.robh@kernel.org>
References: <20261111150812.1874449-1-radhey.shyam.pandey@amd.com>
 <20261111150812.1874449-3-radhey.shyam.pandey@amd.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111150812.1874449-3-radhey.shyam.pandey@amd.com>


On Wed, 11 Nov 2026 20:38:12 +0530, Radhey Shyam Pandey wrote:
> Convert the Zynq 7000 clock controller binding to DT schema format.
> 
> ps-clk-frequency becomes optional with a documented 33 MHz default. The
> text version listed it as required, but zynq-7000.dtsi does not set it
> and five in-tree boards (zynq-cc108 and zynq-zc770-xm010 through xm013)
> never override it, so requiring it would reject device trees that are
> already in use.
> 
> trace_emio_clk is added to the clock inputs. It is the external trace
> clock feeding the debug trace mux, which the text version never listed.
> The example is corrected the same way: it used can_mio_clk_23, which
> does not match the mio_clk_XX form this binding defines for an EMIO
> clock on a MIO pin.
> 
> clock-output-names is enumerated as 48 const entries instead of the
> prose "shall be a list of the outputs below", so the names and their
> order are now checked. The clock cell is an index into that list.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  .../bindings/clock/xlnx,ps7-clkc.yaml         | 145 ++++++++++++++++++
>  .../devicetree/bindings/clock/zynq-7000.txt   | 110 -------------
>  2 files changed, 145 insertions(+), 110 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,ps7-clkc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/zynq-7000.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

