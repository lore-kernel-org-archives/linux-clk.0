Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0ED43B3DA;
	Mon, 17 Aug 2026 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983824; cv=none; b=fSFxbQi9RPRq5S3RTIcCFUqYq9K2UW/CBY6KYTum51o46m3oLKA+T9ztnlv13MuL4fPASyRZNykkmYQ7hmNZxXdGwNmHBPhlKz0iPdOWZQ/zMINFGz9xObf/+42PPL8T5uF+kluhnqJ5jMBWPKjwTelCtqH3IYIpQCFREg/wZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983824; c=relaxed/simple;
	bh=kdoo7HMgQkzM88+nw+IRwLJDx6RcAP8HtEJpvthbWYk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=enlxqsDu1KuGObiUqlwVNiM7So3vHGn6aJpGrCrwhnr/fcOeZWCPVKh7FzZIPsBTrEx/n5cgu0O476hSF5mvXFb4ND6Ba3nNF2F2/SmTURXOd7eUMEtRA2tD46vdF6j0Mi2OypwDIr+OkX4fcFz5pWLncS5yDJifKudx7/QZEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YF0rK5Ue; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YF0rK5Ue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BB01F000E9;
	Mon, 17 Aug 2026 16:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786983821;
	bh=c2p6Il6DuYsITTwntrntjk9VLtEif8koPUy3z5YOPPc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=YF0rK5UeaxD37TSxLBruB+UIZSG79cBpXrhKHLKdAC/jyK6YPMSaXLE9wPh52iqG4
	 bS87SOlgr8HDZ/2f6W17eSJ1Wag2fGKVdQCKowJoQVeSkx5+RYHrh1bnzh5Ekix5Cz
	 b0WwZU3xqXEuBx1pWI4bRZKFPs7Y8Ej9mIZXWX+n5d0LK8uuwsP5PIQoYx33nB0cVw
	 s67wuOoHkf4KDYAH8rai8TR8w3XRGS54ZTCn5RoW3O7gbhkHxpuP+S3DRmiKlPWb44
	 vDPTCgaZs+JpSyJ04MAaapZwSBiqEnfDP3NMidhEeQJEPkLLcvw7YMuiwzasPPf/2/
	 1ZENNGyShqFCw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aoLqSA3XOMJnJL4o@shlinux89>
References: <20260612-clk-v10-v10-6-eb92484eda38@nxp.com> <20260612085812.AA15D1F000E9@smtp.kernel.org> <178672426822.5897.11563790103554525148@lazor> <aoLqSA3XOMJnJL4o@shlinux89>
Subject: Re: [PATCH v10 6/6] clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, Brian Masney <bmasney+clk@redhat.com>, Peng Fan <peng.fan@nxp.com>, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To: Peng Fan <peng.fan@oss.nxp.com>
Date: Mon, 17 Aug 2026 09:23:39 -0700
Message-ID: <178698381923.5030.9178300925075210422@lazor>
User-Agent: alot/0.12

Quoting Peng Fan (2026-08-17 04:02:32)
> Hi Stephen,
>=20
> On Fri, Aug 14, 2026 at 09:17:48AM -0700, Stephen Boyd wrote:
> >+Brian and Peng
> >
> >It doesn't link for allmodconfig build
>=20
> My bad.
>=20
> I just posted v11 to address the allmodconfig build issue, very minor cha=
nges:
> -obj-$(CONFIG_COMMON_CLK_SCMI)           +=3D clk-scmi.o
> +scmi-clk-y                             :=3D clk-scmi.o clk-scmi-oem.o
> +obj-$(CONFIG_COMMON_CLK_SCMI)           +=3D scmi-clk.o
>=20

Ok. Brian already picked this up in a PR that he sent me so I'll squash
this in.
