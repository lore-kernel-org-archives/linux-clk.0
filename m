Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37C243B4BF;
	Fri,  4 Sep 2026 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533728; cv=none; b=e6t+PqleUtSe227gcgh79Zilv19fFUrQd4vWKctgol4+2//U/0aelV3gY/El9HqcOaXPux/Z34tncVY8sLQmB7z0uWd06+++pfAKF/D5DvxyK3miHG7lWvHab34Q+H4fBjEK2NoGiPwRv/1+hH4IS6vG+xYhIz9ghKElh0cq9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533728; c=relaxed/simple;
	bh=QAOR3cmdS5TgaMxBtaq0OhAbCht5qAjdtGj5H+hJZx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2rqzz7oFmkqWqoBRu1VHD71ZF6CKdsPxMBznAQ3NXx2mEVNdQD2Kvq3jQhXScSlEeX8aKkPsyjoM2WfMGvqI0jEEFEbiJwL5a9oTTsXbRBZcAY0BVmtFILQL/G9a8JyaxeqpS19JtDLCWfp/SBCNmjFERGMS75yvwZSk6nSsr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGz8Yq4n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGz8Yq4n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210241F00A3D;
	Fri,  4 Sep 2026 14:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788533727;
	bh=os7DMeDkaVjoD4Ppcby21F8Z9PnDCVhxVdzh6uFMSPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CGz8Yq4nQrS0COL9CRZU3B5sKkRvFwJDTktRS3P+U0XKiJFsTX+UPwUT9fQravI8Q
	 t7yxKVtwwz8Y5sQ63pZFaUd0+fsEu4JQQ9LWpPFmWDOnhpklck7IvpJdp1oPfNateI
	 FynIU4Fox4QGOO4EQt9M1Tee3uRdzqOb/gXts7ztl2mC17E7ppYXZNluSVjUJ1AY44
	 /LhAoaoFgTFAcjIKGDej0EyCwCeCNNe9La2zEbBuoMMmqkXg/Tji9UGUrhTkN8wdUf
	 WQG3AU/HBlERRqzT1I/VV5zajw23UgGyxQr9Vf8B2iK5XFr5om7DXqbCR4ZeStbHTz
	 ULqRstRNC1E8w==
Date: Fri, 4 Sep 2026 09:55:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: genevieve.chan@altera.com
Cc: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND v2] dt-bindings: clock: agilex: mark mpu_l2ram_clk
 deprecated
Message-ID: <178853365461.721871.11051925278426014682.robh@kernel.org>
References: <20260904032849.10554-1-genevieve.chan@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904032849.10554-1-genevieve.chan@altera.com>


On Fri, 04 Sep 2026 11:28:49 +0800, genevieve.chan@altera.com wrote:
> From: Genevieve Chan <genevieve.chan@altera.com>
> 
> Preliminary documentation referred to mpu_l2ram_clk, but that clock is
> now mpu_ccu_clk and is already represented by AGILEX_MPU_CCU_CLK.
> Keep AGILEX_MPU_L2RAM_CLK as a legacy ABI-preserved ID (do not use in
> new DTs).
> 
> Fixes: 6b3c59780ed3 ("dt-bindings: documentation: add clock bindings information for Agilex")
> Cc: stable@vger.kernel.org # 5.8+
> Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Remove comment on unused clock ID 42
> - Reword commit message
> ---
>  include/dt-bindings/clock/agilex-clock.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

I dropped Fixes and stable tag. There's no need for this to go to 
stable.

Rob

