Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF0A397945;
	Wed,  7 Oct 2026 21:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407510; cv=none; b=pV8cW6QGBmlyEDJVO0PYR3yLD7GYDtBSrZQeN9sjZO7WWH95TsIg/WgPQsBowPdMd6lFiQ/+wxxbGwUCLO0Xbpf+md1kUJmP5Yg6nsf8/BCt7t444Z8x3oiVUSt6AjsXOxpD8ls5IkHCgr7zLXtUW9dsYHqga+aWgirkLN9xJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407510; c=relaxed/simple;
	bh=7hZtSXNJjun0EhXAAsX8IaatdeePnZGTN9mboPAKM18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTd/8Kn+2vYqPRCpnsiCRKrckmUEUlWBHlvVPh1ROJ6aYPT9Lu0ytDoKoVDWClEaTyfO8HwY7QljngCm/DLDgsNzGLbDBGMxb1PyanIuN5XTQRYQtlGQAObUo2cdT0rIUgYnXyzPQjYAE5t+BgPKgxFFT3xnA36g/Sy6zjLKqvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mw04+2z7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mw04+2z7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA091F000FF;
	Wed,  7 Oct 2026 21:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407509;
	bh=7hZtSXNJjun0EhXAAsX8IaatdeePnZGTN9mboPAKM18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mw04+2z7vwduJYbHEqA2Zz8evRPYOgT5EgNgzdfU1+UmQ/DYoE6AveDmuWnO9MnQ2
	 5XjHnE5YnkjJ4RBwx5lBdxG2b/FDjudGRy4v9UMmQSaA2IldwnLGuE8kfkoC7Bnd2w
	 AIwcgAXCSC7B4g65uLbNEJXXZ93ZVt9vT9NBfZZWbTb2dPN829RO4IIxmPZekwyoQ1
	 HxyklOA/sWmmTZ5ixLd0WdhlSBehiqx+VgY1otgeFK02BL3DYzNPmNKoyjFOpLhfUx
	 R4G2CjW0BioinENqM3/JcOZ/Zf73Ae79VdGYhFVXP6aI1+BozRrwy64Bx/wedmrMUO
	 2KGA5XbIDcAKQ==
Date: Wed, 7 Oct 2026 16:11:48 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
	taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add LPASSCC reset controller
 for Glymur
Message-ID: <20261007211148.GA312846-robh@kernel.org>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>

On Fri, Oct 02, 2026 at 08:44:33PM +0100, Srinivas Kandagatla wrote:
> The LPASS (Low Power Audio Subsystem) clock controller on Glymur
> provides reset support for the SoundWire TX master when LPASS is under
> the control of Q6DSP.

The subject on these should probably have "QCom" in it somewhere...
