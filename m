Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42524D4886
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953920; cv=none; b=sUgKCF6SVbo5NE6y9HSvIDdcjoFWCviKYmF4NPJTZ2Lf86F18CYRd9as/otVJ5ex807H4KpvMsF2g4ZTTJ8VVexUGbdzC+pq7D24dlQkO5UaWdq2JDe3b4E0r7va5nyjHpIJeR0hkj3U9Bp0aETGic8LJ2Wpb4ka16W4fyzMpbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953920; c=relaxed/simple;
	bh=BXSTojC4lp2VomfKySiwbSrWTs82k5is0N7A+po482w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOsG4bHh2u3g+rFOomE7HHKX5+fXoGXOlR8MN5ulB+KFrqROF9zriq8i4XONS8Yfhtx/sVajbBm5jR/619zK4pBUWvLWWlcZjcS5nHs1XGQc/jK8/JiqmM3L/aOptcUY59+I3HCnuCphk1I5du7UMfx5BCpmAdtZRPgxv6QXmDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GrOBZ3DC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pN/gn+T8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GrOBZ3DC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pN/gn+T8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790953917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWmLd+rLGF8wp2MGoAWUFRqguzK3p2qoTL1+rkmSfkI=;
	b=GrOBZ3DCcTz+fLX0P6vRG3M6AEd8qeGvuVNAeFxscJZtchngQfND8TIg2N5YtTl9iKpr+G
	3/OmAnEhl/SxPZeDulKAtN7xTnlrh7SKv76WOhIZ1ImiZ9ZKnPFcvWmWOgdFhhCCHV+qCO
	vE1QzMrYCpeIBFfUWYroN4wDhLh2avE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-xo20fGU4PtaR5d7KUoYcVA-1; Fri, 02 Oct 2026 11:11:56 -0400
X-MC-Unique: xo20fGU4PtaR5d7KUoYcVA-1
X-Mimecast-MFC-AGG-ID: xo20fGU4PtaR5d7KUoYcVA_1790953916
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so1887810585a.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790953916; x=1791558716; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWmLd+rLGF8wp2MGoAWUFRqguzK3p2qoTL1+rkmSfkI=;
        b=pN/gn+T8xbN49zVpBn13gV7HsChE0Sk3cphEVrJs6osThGDtD3g6Lgz1C6Cd3QGUgv
         MUPECoNqBLI01vuAuRIC8n+w0cgGF54xvtuOQnRnjB0CxI1Mvb9B1zdpJXJpqfNFpgW1
         WHQj4QaDtdebuPXIDE2Cry8FHWzriIquA3mjygGbwbLC1/s/lY+DmmUm/MiK4iAT9LBk
         D6tjdknJrK1fxy8r3z6KQ4saHba56h9gixc66poY6m6O1bQb9BzWtqO2NVNlwBq31LTj
         D7dh8u8EpHM1OOwAJIaqafKgC/uqZVd+n1VcOcVl7TuQltSMBnOqzdkryZBnY3DiK112
         NUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953916; x=1791558716;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LWmLd+rLGF8wp2MGoAWUFRqguzK3p2qoTL1+rkmSfkI=;
        b=gAklP6T4ItXjxj6L8nU0Weh+BLcegULBUvU1jJK4lC7KQtDIoWV6IEAM1y84a9vKuK
         G1eo9Q7dt8g4KCJ6Wmihcu0aKJ4C5aVdsFvywWZnQqvzxltYknDxyFl6Qgi1Rr/LTmQc
         bU1/1BsO3tanJudHcidu2BR36OK+Y5/+K+yt2I38DfEC7l8djUSq2ygo3+KzGpUlGMaj
         bi5pQEVA1mXOsBCpuCYFzKU1JfWvW6o7kfLCJNGVPQ4hsLYWE298XnRvjx63wqupMUtW
         B61n9bi3+2eCrtx4X1JtjmW0955/IfR5QlMaPYpBGJB9RZiEjD6gm5zYYwlwNldX0sxm
         /G8Q==
X-Gm-Message-State: AFuF++lZtM3xP36I1qrxA7SfhAOg0FXObIvTYU1yXZCh0neIU1CXrlb2
	pDldC5I6TPJf4ypjMYXTRl5SsRRUJCDtpDySzhe2V+lIV3DGJj+HuZDjAX93sqiK7PPeWE2EPM4
	gxf3wWobr9DAhkUC9EOSsmMHh5o3Y8VLSYuKSiDXU1aZYW2FhZ78YQj+UiuFfPA==
X-Gm-Gg: AYBFou0atEK50YpFNV7nVGgK6SBYvQhlSVngbgXxq6pnbJmML9Fw642/6LNZCHBSYj1
	CJhF5Jfw8hyYB+ISWIpsTHeCiiuJJHEMseev57OWGv4c6ikZvqIDCk/8oIiYP6Pja+Od8DqEvlb
	ATvihYPPrN0CLxC2I5F630sS3mnNIqlCLg7GWUFcu+jG3xPoY95a1maquLmzNc5J5WZXdKtchfD
	/i/LkqaqGn5mtS5zLy6dZ05RbivsPHstt8KLpMvqj+Jkz931O2n8EJOSxtVmX8a+UjOFx4quC6s
	G40RgxzcB1GojfZEbsLrfiMN7ds5saY9YvbufmodbMMIROmhJS8PSs8sOjNqECluyWBocs3iPsl
	dv0DTqfjVqsOCMMOeqyvZQIGXy+7z5QKLRc4=
X-Received: by 2002:a05:620a:26a6:b0:93c:5efa:39ae with SMTP id af79cd13be357-93ce7c1228emr548900485a.12.1790953915889;
        Fri, 02 Oct 2026 08:11:55 -0700 (PDT)
X-Received: by 2002:a05:620a:26a6:b0:93c:5efa:39ae with SMTP id af79cd13be357-93ce7c1228emr548889585a.12.1790953914967;
        Fri, 02 Oct 2026 08:11:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a433dsm240505285a.13.2026.10.02.08.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:11:53 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:11:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, mturquette@baylibre.com
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver (v2)
Message-ID: <ar_Jt4eIPy1-uq1-@redhat.com>
References: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Stefan,

On Thu, Oct 01, 2026 at 08:39:27PM +0300, Stefan Dösinger wrote:
> Hi,
> 
> This pull request contains the device tree bindings and clock driver for
> ZTE zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and
> adding drivers for its PLLs and clock tree. This is v2 of the pull
> request, based on v7.3-rc1 rather than clk-next.
> 
> The patches have been reviewed and carry appropriate R-B tags by
> Krzysztof Kozlowski (bindings) and Brian Masney (clk driver).
> 
> The PR does not contain the MFD, reset and device tree patches. They
> will be submitted to the MFD, reset and soc trees respectively. The
> clock driver compiles without them, but won't be instantiated without
> the MFD parent.
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/v2-zx29-clk-for-7.4
> 
> for you to fetch changes up to 75e4151c9e157d84c8c6c365893ecf33d221bca5:
> 
>   clk: zte: Introduce a driver for zx297520v3 LSP clocks (2026-10-01 20:20:43 +0300)
> 
> ----------------------------------------------------------------
> clk: zte: Add clock drivers for zx297520v3 SoC
> 
> This tag contains the device tree bindings and clock driver for ZTE
> zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and
> adding drivers for its PLLs and clock tree.
> 
> The PR does not contain the MFD, reset and device tree patches. They
> will be submitted to the MFD, reset and soc trees respectively. The
> clock driver compiles without them, but won't be instantiated without
> the MFD parent.
> 
> ----------------------------------------------------------------
> Stefan Dösinger (9):
>       dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
>       dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
>       dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
>       clk: zte: Add Clock registration infrastructure
>       clk: zte: Add regmap-based clocks
>       clk: zte: Add zx PLL support infrastructure
>       clk: zte: Introduce a driver for zx297520v3 top clocks
>       clk: zte: Introduce a driver for zx297520v3 matrix clocks
>       clk: zte: Introduce a driver for zx297520v3 LSP clocks

The commits in the pull have the changelog in the commit message. For
example:

https://gitlab.com/stefandoesinger/zx297520-kernel/-/commit/75e4151c9e157d84c8c6c365893ecf33d221bca5

I went to the last series and cherry picked the relevant commits.

Brian

