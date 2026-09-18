Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB4352027;
	Fri, 18 Sep 2026 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740484; cv=none; b=MqFaCRq37Wy2sOp042bFYZHKhbr7hpMEnHYIHp3HBJSIwt7g+Ex40rnMl273y7wIA99Nwdo0VmFi2n2AMuqKe7acHsFIw9cY4IT/bc8HEeSs4NMvpwA8pCoDqYI7+pLQHPTWShCeLKWMscosQm4bkUEJM4XLdY9EiyRmkY6iS4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740484; c=relaxed/simple;
	bh=H7Lm5aZFlpWNaJoqdVcvDWcRzm5tQ/Jd6Vf9qNCs9UI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dp+XVY96thA8B1g8bhFrSvLemu61ME6z/Me2/D3yFR0DfoNZru7QRh/yoZ7ilXFXG6s0NMKpudfvoCPHC4fZ2FnifVdv/OTn6/Z8Ibobqs5gc+xZClRoTQjwLfTn9Guc6jG5YyhINNTrzfoGKWGzdH3pBzAeCCRqVNYDPB5gyzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwwFHOle; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwwFHOle"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C1D1F000FF;
	Fri, 18 Sep 2026 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789740482;
	bh=H7Lm5aZFlpWNaJoqdVcvDWcRzm5tQ/Jd6Vf9qNCs9UI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FwwFHOlevWjMt3HjhEzkBGcJv0GA7A+SYdiRpQ3fRg8mT9vlbAx+WKPFU3ltCjPDL
	 S6CZc73j6l8Bw1JX0Jum+/ZVS0E3yYvOEKHMLke9vACaI4GE9SYoNcL7gUOCLkDTPa
	 lTwXDyZuOcsyVFoRMjo4zIRjkxkvRcxILuPKp3icBYh2id/98wmF9URRKs/8TXBbOZ
	 T/edPkHGKbdzRrbiyJyIrUqA3cY2j7ryMkc7SlIGyuA5FjF5yfe12r1LRd+OwXyWyV
	 dnxVrW9DBr83Vtm4Rxq1zB7iMbMg1SiUTHMcWHFbaZiytwWp5+7Gixpe2jaEjmpXX8
	 DVa1o3V1yRkog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 4/6] phy: core: Add missing kerneldoc colon in two
 locations
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-4-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-4-dc244e124e71@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 14:08:01 +0000
Message-Id: <20260918140801.A5C1D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] phy: commit message says two locations but modifies three
--

commit 5a2b69cff2bb3f7d12d886564973ff075c24a850
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: core: Add missing kerneldoc colon in two locations

This patch corrects missing colons after "Return" in the kernel doc for the
phy core.

> phy: core: Add missing kerneldoc colon in two locations

[Severity: Low]
This isn't a bug, but the commit subject states that "two locations" are
being updated, while the patch actually modifies the kerneldoc for three
distinct functions: _of_phy_get(), of_phy_get(), and phy_get().

Should the commit message be updated to accurately reflect the three
locations modified?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org?part=3D4
