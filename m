Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006822;
	b=3CeWmgj3o/Atj7+O1sxRZ/jR/bp1KcK0IhGH16mhm4CIpbrXLyo5JFJfp2anXz7UE/vh
	 e6nEsYfZe+rqW37N+ZQN937cffEJMW31TOFiWzarukSqi4oy3IrZX9Uqun3iATsk4DAHV
	 lHHfRDFK4csSXMOm1Fdr4N926ugdamOP+4E6ZEIpAzwv5tGg6ylSvTrV80IWYSyv0I7pL
	 52SxVUIrh0xOja/wichVs56T98Nm2W98rJqrkRnOs9mI1PI3fFLmoHpUUwvyF3YHmAGY+
	 FclJtTkpn+EUfL1LnYqlA+UPDwNx+GCy+fkZKQhyBN6JuWzpnloFqjsNy5CyYXlGQpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006822;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IYyk9FplTSoYIbq0ecvOMOcOYypp2RIxntZRTUSjpnw=;
	b=Yd6Edx742AFdBsqr82Yzna3ij1Krhwiw50wxTY41xJ/SdTuMaC2Zo5Qdo42FdSOi+/iD
	 geX4HqO0uy1mpYBjCdix+OMAiwVoFsjDpH6/0Ryr5J747514YGdzdZge5RsToIXgZp4oH
	 mm4GHu7jm1uunT9Oku1gtiKVhXS30bRwhAadsA6GCalasZhWA0j7U4Qr7p9v9z2YEfXtH
	 SAz0a8YsOvcCcXQe8EcPzz2lWhCFMm7MvACufxFVI+6oG55M1HfKrGgYrQ9AI/ameHCxx
	 rfqDYh6ntfM1bNriFev8G9BqzWcAfooEqr/ktZAqd8Vyg0JCCZjW/PpB12r72FkvXTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QsJXcZ2p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78611606A31E;
	Mon, 26 Oct 2026 09:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QsJXcZ2p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE681F01825;
	Mon, 26 Oct 2026 09:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793006822;
	bh=IYyk9FplTSoYIbq0ecvOMOcOYypp2RIxntZRTUSjpnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QsJXcZ2pOM2SoZLwGb/BWOCpnixmMmHGnVNaCUvw2NV74tXrCD/b4ojtcXB1nR6sT
	 aTtptYQQot0vI/2U/3x68JdkffKrQ/p44aWTo2Azg1FbmMqKcQxWtor+NvztlRtcct
	 /deMZ5gH+NlvN8IKMiLM9AHFCuztuJmWXjGI2FMkErNiFQCyvp/u5kAeAmGcscaQXh
	 oExeY69m+aIS4B+/JW3ihNd/z06yVGghR5UoWqu95E2k++McxrX/xmI+Sa3Ccv7vWT
	 qLxRvjYukVeNgzdomSGP5yA/9zY1R6SbjS3IrTh4OEIlwDm6i7SkMAqs4aGOtGXvux
	 TQD4uBiFaXjNg==
Date: Mon, 26 Oct 2026 10:26:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
Message-ID: <20261026-elated-lyrical-sambar-fc4dac@quoll>
References: <20261023-gpucc-sm7250-v1-0-d9149cece8be@brar.si>
 <20261023-gpucc-sm7250-v1-2-d9149cece8be@brar.si>
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
In-Reply-To: <20261023-gpucc-sm7250-v1-2-d9149cece8be@brar.si>

On Fri, Oct 23, 2026 at 03:40:09PM +0530, Ishu Brar wrote:
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.
> 
> Tested on a OnePlus Nord: the controller probes and provides the clocks and
> power domains for the Adreno 620 GPU.
> 
> Assisted-by: Claude

Same comment.

Best regards,
Krzysztof

