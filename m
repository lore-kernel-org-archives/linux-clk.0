Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCB23B6BE3;
	Mon, 28 Sep 2026 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630030; cv=none; b=eiaKJ5kD7hXhC/8s3iGw+U55Us5cL+ZST7e7eXUg59YBDJ3R6YUeMLK/Scg2EwfwZzrR8wdMDLxlHbxhfWp+KsNCO4IpBYlucCasWbHjrxaWySBUbQebMVVUwBhCARDADf/XWruZF3V6NVI6glVTTMQF/e5+GnknHAMin3rSyRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630030; c=relaxed/simple;
	bh=O1hQFvP/KpIcPacnQUE6Xa3tLyG5zjug2dkqqp7FAk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgZL5D8yHQhCxjZbE67SZ4vvdW8IHtJz5VM7h2ptQ4Q0A7WP+JJz+NTFI5nbZn71po2KhpOJvNkQ/iKKYTwHa9U3PJXG3dUyZDX5eQTxLBPE0riXH01mdybama28x/TROO1ubQoCVjqWdq2ibwJ4umn875PuKG2t4JsJHJvXMy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwTTu9Rl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwTTu9Rl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0C41F00893;
	Mon, 28 Sep 2026 21:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790630029;
	bh=iAYi9GazaJvPghQlM3MwqUSbqSacae9oKx8hTh5ZMmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KwTTu9Rl9SfSFqMUIO7f0hkKqs0MITNheUZM1iPqw58FlMIRsuYcXU5H9hSmFqn+X
	 mwat0jd2m26Oqqt9GAAN1gn01kvSYE27c2GpYMAIwzoGQSKTYN4Ss/PrAVAN2B9m8a
	 U6DnkCqildIJ84ckoyCcxP/jPLDqWS5hPhyw50k10B9ZT+3ayLajlN1nSOIe/wkbY/
	 LOKJalAn6zvGy0Lr1me4MCTqJksFT1mtguDtGmQYVVT9eXmbKkNUsTSY/fTgKiEgOH
	 tnfbzC6Qu2BNoWhiyE0Y7/WdbX4y3MLRpqCMDf4+pQkenHpuIU9mV/MNncqpZS+Voy
	 Vw+13UI00dpsw==
Date: Mon, 28 Sep 2026 16:13:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Cc: andersson@kernel.org, bmasney+clk@redhat.com, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, sboyd@kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com,
	jbrunet+clk@baylibre.com, srinivas.kandagatla@oss.qualcomm.com,
	krzk+dt@kernel.org, abelvesa@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
Message-ID: <179063002588.652413.6187183335984083646.robh@kernel.org>
References: <20260928-master-v9-0-2277f09f9a09@oss.qualcomm.com>
 <20260928-master-v9-1-2277f09f9a09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-master-v9-1-2277f09f9a09@oss.qualcomm.com>


On Mon, 28 Sep 2026 21:27:38 +0530, Sarath Ganapathiraju wrote:
> Add a binding for the Qualcomm LPASS VA CSR rate generator node that
> exposes the lpass_heartbeat_pulse clock on Hawi.
> 
> The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
> start of DMAs and Codec Interfaces for the audio usecase and can serve
> as a periodic wakeup source for the DSP.
> 
> Require the LPASS LPR and audio vote clocks to access VA CSR register
> space safely.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

