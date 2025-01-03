Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD6B1B21BE;
	Fri,  3 Jan 2025 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930959; cv=none; b=QaEpCaeQXq8qrMp2/MhKNBK/ZTA13rnAa0zZGz/sySRetQkXkq1dmR+9uBZkB49ituGtyelhz18WI4q3IQgoaa1yZg+nqKCceDRWrVClCXBjdpvfUfTALt9jPvCKEZMoGCcB3SodnAbQMAyEWWZ2dvZGpcU/M+siPuUjEOXJVH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930959; c=relaxed/simple;
	bh=ROKm26zYjtVGso2D9k6xdXLPr8Xlhh6uzj4BFB9Dvxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJ24sFRPnoHDWx95at4r/TZsX+kl3WEgjOFedWo554bapN+7f+4Lv9rDMSU2Iz7bH9NH8rNIfpo54kPjy2FsoYvBh/2+xko+j9w7IhN5Pk1OXdGXByt4IKstU8SwLRShBkbtk6t0od+25nzzaSObeLp8ZBW7pAYEGxpPrrjQhOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmiqMEyi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmiqMEyi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6BDC4CECE;
	Fri,  3 Jan 2025 19:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735930958;
	bh=ROKm26zYjtVGso2D9k6xdXLPr8Xlhh6uzj4BFB9Dvxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmiqMEyipWsfK1pr6JNIIjBnTYXBG6JPlyZRxwEJJS3Hw0An40h7OVgybzdz81d38
	 k8ELYW88QGmKm5Itw9NC9dqeZ4tuQNY+GTsnnZnJPxQV/tuL4Ko20rBpdumfCp7guV
	 ILGU49EsKAdtdAINHROIGwZ9vHiyBfNusplgI7edMKzrQHfWxmiUhfhtLqWvFBPBl8
	 BNlDCDXdjuZoFwOPoEpokiYwET61I+K2cjTrwLkvKJaYOduhIgMfOst+zDcs0Ab3vo
	 Zfc2wxVvIx3jG6rjGVGrnxteMeCONnUPTBBMxCkOlvwIWF99odej6DOwNdeNo03TeQ
	 +qgCoVYfaqjrA==
Date: Fri, 3 Jan 2025 13:02:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>, robh+dt <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
Message-ID: <173593095558.2568839.4677596962650586768.robh@kernel.org>
References: <20241231060047.2298871-1-jian.hu@amlogic.com>
 <20241231060047.2298871-3-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-3-jian.hu@amlogic.com>


On Tue, 31 Dec 2024 14:00:44 +0800, Jian Hu wrote:
> Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  include/dt-bindings/clock/amlogic,t7-scmi.h | 48 +++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

