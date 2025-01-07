Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF69C18BC2F;
	Tue,  7 Jan 2025 19:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736279561; cv=none; b=Aq49F6A7enSr6ekQso39j12co1qDoGr+oFxIj/Hcvicq6dA42dfcMeNemBf91zwtCmiMxXc+rwUIkLh4jHu1oVpWWJNHLjcN4dtvIfVpB8TeShAmTBrYTScj1m/kp2m3BTIn9Ct81BUI5ZWipIGd9nrIdogKmxVUoncjUc9yGLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736279561; c=relaxed/simple;
	bh=9MlZNSuihMzsbpWH5zZsR1I+UuImjUXgbUhx3ezXKa0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=E+itYCGCb7E33uA59ky7UbSfUdV3fpJhi/fglji819SPCvBFBVlHv20BJK+2iIDy3dWAfjGugNyxMSAypTG1qayhxnXrBQVnuW+6JzljdLh9SF/rmwpWQlDtQ7taVXf8zLG+1qM8MsYfKPVUn5lHXGZhut1bxWI67nmU5J3G2N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFTFQBHo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFTFQBHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F1AC4CED6;
	Tue,  7 Jan 2025 19:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736279560;
	bh=9MlZNSuihMzsbpWH5zZsR1I+UuImjUXgbUhx3ezXKa0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pFTFQBHo3h4saiNnGCsllRyOcrDDUrPpocit4lCurwUEEubLaPeYTARdXT06mXJ96
	 A+t8NPXJKeG+RLLbzHxwgFGuHyOTdvQpVpFPPCu2J4edlKRdwMrGcpHjnEzMZzGjs4
	 0iZfmJM2rrNvCOSrjkU2VjBZZisKzaJqfGxVI0v901xzCgjgf40wv8zG5ER+RoIo5N
	 MJjG7+7odbuEbJrOliuFVEYztKKmDvI9xLYuBm++51wmpfoKrsq0/VEKFnUQTT1kD5
	 7l6sS6WfnpQN4lKvjpmtbWGt+tfgtchWYqtjQ+vSs8eIFSil/hLoELTHrduV0P6YGI
	 CFnLBTUmfKOMA==
Message-ID: <b35471953c18b7918103ed52432c4b64.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250106082937.29555-1-shubhrajyoti.datta@amd.com>
References: <20250106082937.29555-1-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH] clk: clocking-wizard: calculate dividers fractional parts
From: Stephen Boyd <sboyd@kernel.org>
Cc: git@amd.com, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 07 Jan 2025 11:52:38 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Shubhrajyoti Datta (2025-01-06 00:29:37)
> Calculate dividers fractional parts to optimally modulate output frequenc=
y.
> Clocking wizard supports having multiplier m and divisors d and o.
> Currently the fractional parts of m and o are not utilised.
> For the pixel clock usecases a higher accuracy is needed..
> Adding support for m and o to have fractional values.
>=20
> Co-developed-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Tested-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---

Applied to clk-next
