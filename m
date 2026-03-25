Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050332459C9;
	Wed, 25 Mar 2026 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448526; cv=none; b=C2I6OFMizDCdri2R9bsXAaYBecrwOp7pq8BulhN4YQ8B0ziYeqUH5Nhm7CkPY3rf/mJ107QKZ+Ml1ljnVRAye5Bb2GYJheKT2Vm0fl6ovSxLeXz+r9pcyLDbSuAftDSjBCGNnOqpapVdfDEi/DpnZuyqsXgxeABlXxdhc822kVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448526; c=relaxed/simple;
	bh=D8plBvkxo4lFOs0Y+oJaSKr/RKE855ApyeyhXvod+fA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aR/V1dsrGSnk0w0KYk8tEcVkcY6rGPiy8ixRB8TcZ1LhrI2CatdYw7f5GRp2oPOXke3BY1DhUe2ygWrXlYbck9Gn5VDvkuHAoN/45YaitwlnDb2ohjdiYN7Ar2XeVN5o8A5xisjoRCoBRMuiN0/JvMMpsBm577yjEkAoxEj9feM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+qmW1/2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+qmW1/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73195C4CEF7;
	Wed, 25 Mar 2026 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774448525;
	bh=D8plBvkxo4lFOs0Y+oJaSKr/RKE855ApyeyhXvod+fA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Q+qmW1/21X4QW/08xsUd2EPczPV3dTj18p+zRVzh4A6EfSXHv+LpwoN4r7UvDnNjU
	 YOYmcftw/1XtTkGSEUNHzlNSzYbRwpdDxiTEE/MjKutjGfxKEz/jVoG/xH+AfWty1L
	 ZhITu4QVPEtFmo+JT2YA/PaYKY9ciOjtiqYRI1QdSPaSnQVfhXYG547eZgRu/qjdO0
	 HGapF7WtaIkY2wIFyydbGGsbHdhC3/iP/OP2Tw4PGPVDlkZl8sEmIZ9QEke0GVus+n
	 XoDMk9P+qYk2L11/oFWJQrtfSUrRKTbp9mrJdsAA/qTgrJBoiWgQ0Ifwbom939nV1u
	 6WFQAMoVbTOog==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260312162449.569359-3-cjd@cjdns.fr>
References: <20260312162449.569359-1-cjd@cjdns.fr> <20260312162449.569359-3-cjd@cjdns.fr>
Subject: Re: [PATCH 2/2] clk: airoha: Add econet EN751221 clock/reset support to en7523-scu
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, bmasney@redhat.com, mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, p.zabel@pengutronix.de, nbd@nbd.name, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Caleb James DeLisle <cjd@cjdns.fr>
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-clk@vger.kernel.org
Date: Wed, 25 Mar 2026 07:22:03 -0700
Message-ID: <177444852331.5403.14382259400187114857@lazor>
User-Agent: alot/0.12

Quoting Caleb James DeLisle (2026-03-12 09:24:49)
> EcoNet EN751221 clock/reset driver is significantly similar to the
> EN7523 / EN7581, however the EN751221 does not have a neat batch of clock
> divider registers so there are fewer known clocks, and the frequency of
> each clock is derived differently. This clock driver will probably work
> correctly on EN751627, EN7528, and EN7580.
>=20
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---

Applied to clk-next
