Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A024441035
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135015; cv=none; b=BRLJKgANuFpSFKAUq3PdbT6DD7YitntyQBnzwnwjTZqu1gqlFC3o5pcqtnHZ0chb/BqKLvtwG3zvBVuFnAv/XOThPQArs+qQMUuf0erZVAYe4RiypNZq9tkyEH36cNAdd7JkR5I/MPwTSgFE9Q2Tg9X1saNg4Yc82AK2W7E/x58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135015; c=relaxed/simple;
	bh=tUMHxYXSagDCX/IEczIaFVmBvhhG7AVnyMludvqtERc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l5XCiyef9sg8uVRURL49um8oCQTGq2E5HwpszMIAm2C8Y6VIVHeh3SLB8O6fzwQ9Q6WDgvTmGcCfJQtOp75l8zcKBX79PSMxY6Bf26z3mhG6/ACZBeKMD8v6oZEVRTXUNemJPA80YRMG8fTsJs+B48Uaq59nwg8lYTYffgWicsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=hoWcc4nn; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="hoWcc4nn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BQFB551uQxWQuLg3XRRlCuau7a6nCD7Elvt70vllWfE=; b=hoWcc4nnibu5kfPRzlIdx5Scie
	T7YdxgowCXYrlHh818iISKD+o3IxN63Af/h72WudZuS0EyfpuhOY223oCc5XBavVu7qV5WOeH6fwE
	uTW88E+j4n/KAJsxZezjBR0q5qrsAXCXz3nYzbEJ9/iM33c509Fypzm1UuFxk4IQA8JdJEvjSIZq9
	BfVHJ1QgEt1fCaID+Be3/wh0kReQybezf2c7aDq5k8ySzhWMfsLQ3WRcjTFCaZvnn2nepiuVFk0d0
	usLUdffZ3utfzLkZfqklU9xlFlEBAp5PnjUEWlojPxDiIj3wVqig2ZpUGSY4wLiVixKVGwLkq8y1o
	VbhPW6Dg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: rockchip: rk3568: Add PCIe pipe clock gates
Date: Tue, 10 Mar 2026 10:29:55 +0100
Message-ID: <177313498967.2340533.2279759049347731335.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1772799641-32164-1-git-send-email-shawn.lin@rock-chips.com>
References: <1772799641-32164-1-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 06 Mar 2026 20:20:41 +0800, Shawn Lin wrote:
> The PCIe pipe clocks are currently left as orphan clocks and remain
> enabled indefinitely, which is suboptimal. Add the missing clock gates
> so the PCIe driver can explicitly manage them when not in use. In order
> not to break compatibility with old DTB, mark them as CLK_IGNORE_UNUSED.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: rk3568: Add PCIe pipe clock gates
      commit: 41b1a6760959017c4fa1dbc7c3cc318406ab1455

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
