Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C373890F0;
	Wed, 29 Apr 2026 03:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434404; cv=none; b=fmNd59sE0pET3mS4TR4RknOxfq3zCQcLQ1iBnsE259M+yTEe1LwAvk6zZxS23duGBCcWDsMBDU1M8BJ9upKeAGK28M/+HAG6KlRRbp2jacXg1Tfd5N2+GUHfwq2/bXYaLgDPW+ojiP/mm/tMlcOsddkIQSRdcDSX99xX3MH1pkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434404; c=relaxed/simple;
	bh=gd6WH5Z2Y9pPHA5ZlnmmPDlhqK92DmbEQgMULDuoV3Y=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Jwer5DochsSTwJ/hRtP3W9OEZlt7RYDvTbsjxoSWBG8sxaAEiCqHcNzz+2pCxIHvu/oLVG0cVJccKKK+gv4S3eSWwdndW95mI7Vqf4QypOzjRtAdwMDDJBKBBXL5fnI7AZ7UP3tP5fTB1PeGzK2igfZVPbo5YNdW46IMtYF/fbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfcnoBJk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfcnoBJk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4E3C19425;
	Wed, 29 Apr 2026 03:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434404;
	bh=gd6WH5Z2Y9pPHA5ZlnmmPDlhqK92DmbEQgMULDuoV3Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NfcnoBJkFJVEe4KUMKZ4qVKNI4tK5IzsIxGn4AONb6zTrrrEB5dWbwlzw7iiCV0NJ
	 0KYACEtfFUdrzdl8fkRwUwONmNbHocM2p9NJGWAui8imgcJnmFgjhsAVY/5i+gncNM
	 GGFieiLoffbsLqrPx1PH6mlZStqqE5ywAjOth7/pDKk5XOahRRA/qdTAZdvBB6ZmI3
	 Q0JiAlSZ58QfSY3QjKt7bR3eNcasxQL4DB8B//xjYrLUeYqZDhYI1ellAFO6cw1bLq
	 hgCQ7JW8kcdL2WkdoDT+R6HTgYcUBYCGCfpSzBGu6xM0/Jx161tM94/LhTeu+Hm3Eq
	 v5HET6pOLKoIw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260326045324.240150-1-rosenp@gmail.com>
References: <20260326045324.240150-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk: bcm: iproc-asiu: simplify allocation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Date: Tue, 28 Apr 2026 18:45:36 -0700
Message-ID: <177742713688.5403.2563831165371967368@localhost.localdomain>
User-Agent: alot/0.12

Quoting Rosen Penev (2026-03-25 21:53:24)
> Use kzalloc_flex and a flexible array member to combine allocations
>=20
> While at it, take clk_data out of the struct and move it into probe.
> It's not used anywhere else.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to clk-next
