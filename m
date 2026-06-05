Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B89C3F7892;
	Fri,  5 Jun 2026 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655076; cv=none; b=d5bpjk2xka1G/Ki34Z4HlbZ7Q4sc5ikdQ44y1jjXYJwyA1KLPSSTB27MrRXgtY+g8WzH271F2CdUGQW+zaFwbzadjozLsLnriOhj4TAGWuPqIcYAfPa4Sde7bIRsIsv2K8YArBuRWvemoEUfq2Gd0Yr0JOeLbMXO3a9Rq40uZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655076; c=relaxed/simple;
	bh=IdeUw7sIEOpzQ73QL7KRvl5p8XDG6FyEeO2ZdUbKcTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScjUF/hDQF+XTGM6In2rY+mnbNMLPh8ZeW5cD1MEgQ5Q1hSTD3Re9LHtWX7Qbrukanyj8NVwGrjAD0THbXgBk4GenlLlcYehMm6A7FV01Dvbv0Ev4FgWbLjH+D0WKt9ZencARsuUOk5CO2/ILKwL32uwyN3eqI1FyZLxUdSVRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uv75+4Oj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uv75+4Oj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D46B1F00893;
	Fri,  5 Jun 2026 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780655074;
	bh=IdeUw7sIEOpzQ73QL7KRvl5p8XDG6FyEeO2ZdUbKcTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uv75+4Oj5Dv1qJbsaymsnY9YLijFgrxyuL8YBnUh24FrdtS1SAxpzPgciCykTRnKc
	 MMxrFCs6UQqluUK4mNgSQXtg4pErOaKcNck+jtAyhzhMooTVlEAVQ2kp+QTrCV6STJ
	 nGn6C0Goh3TtGtw0mM5Fh11QdlWNuhnHhrK/BshdrxiAUfNkRqa06PvsY10iysFTMU
	 fEKu8284rczF+I3N8Lq8WzMLa0qCbr7dLRV1PIz1teKnLkjyL0vcwcUSnm56IEJ2Me
	 7UEoQgtnxb9+v4rh5Derzps/aH1arKwW23qhrgAK0C40C6VQlaGNhFktt/RFM4vLhb
	 VhGQPD1arScjA==
Date: Fri, 5 Jun 2026 12:24:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Brian Masney <bmasney@redhat.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/13] dt-bindings: clock: qcom: Add Qualcomm Shikra
 GPU clock controller
Message-ID: <20260605-camouflaged-seagull-of-chaos-afeaf5@quoll>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-4-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-4-8204f1029311@oss.qualcomm.com>

On Thu, Jun 04, 2026 at 10:56:10AM +0530, Imran Shaik wrote:
> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
> hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC

No header file? Are you going to reuse the QCM one, so basically you
have the same clocks?

Best regards,
Krzysztof

