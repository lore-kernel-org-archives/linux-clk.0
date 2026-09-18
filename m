Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D763A9D83;
	Fri, 18 Sep 2026 01:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696203; cv=none; b=fZ/YnQdQuuDmyfx228Wj6O8Dvt9VIfb1/PqpnSSwuYFLjIxMCrXZCOckKMXh2wzbySIXzTixSZLsirsYlwKalNCI28NUJe+SM6+YNsEEU+TqFj2ksyFu0KbHYB+FVCWvOSlVmPF8NSW/SW1yr48aMiV+ayv+A8jihjvRoKdI0cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696203; c=relaxed/simple;
	bh=iDcjO7SQOM0BL8BXFxOYfo8RpBFZmH8NcvcYto9LC98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AyAoonCppJmQ3KBfUig/hXj7ApSRYmKRtPLQ2xSuJRJQ62xkOKgH5ND8MDmC9dT41QVO6fBj5+F4M3gaY7nKc5ox37C3O+fiZdP/qIlIdbr2F+mUFAs8PEfkIBzIOCQfSfHP3F/LYc2B+M7p6deLGqGKVqCrSKTPskoMb0Z9XJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAANUbdt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAANUbdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8029E1F000FF;
	Fri, 18 Sep 2026 01:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789696195;
	bh=HjlJkfWxEJHuY15pqHOvaOL0dZgn3vW47MuqmveYFyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WAANUbdt77eHtm/ALgZAq0ESgwRqRCS/9O9xT04+vNooxbA2dGpqAahq23WFKLO/s
	 m3yFwJViXzPC59wIEmfCw3l7LHN8bpv+gBUfxqss/tgs7D1X63N10HCnuX3evEg7oM
	 B8aLvRadheVX7JmJOrxVGo0jIbTAxr6PLPHJuAPg9gepPw0uct0yXOh5JcgF1DusOk
	 vxaFWpBvtLRtIR6U6dOEZE9Iht6NvTi2cXhPvlMiBfXQQspicZDvUVCneQ8CLGnwfb
	 kdXwb1L28bg8JTyhEm8OmqwOuGBnQo+Q+uYgNSgMJ6WySxAsP21GqcMboXTKxuLIkz
	 k59CDLxL3qplg==
From: Bjorn Andersson <andersson@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Brian Masney <bmasney@redhat.com>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] driver: core: add subsys_platform_driver() to reduce boilerplate code in drivers
Date: Thu, 17 Sep 2026 20:49:44 -0500
Message-ID: <178969618825.1582337.11100417882754456102.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Sep 2026 13:47:17 -0400, Brian Masney wrote:
> There are a fair number of clk drivers that are registered at the
> subsys_initcall level since some clk drivers need to be initialized
> early for other drivers. Let's add a new macro
> subsys_platform_driver() similar module_platform_driver() to eliminate
> some boilerplate code in the drivers.
> 
> This series converts the Qualcomm and Renesas clk drivers to show the
> code savings that can be achieved. Once this lands, I'll convert the
> remaining clk drivers this development cycle if all of this can go
> through the clk tree.
> 
> [...]

Applied, thanks!

[1/4] driver: core: add subsys_driver() macro
      commit: 255a14e7c16569f75248640dbd854c632b9d4bee
[2/4] driver: core: platform: add subsys_platform_driver() macro
      commit: 5065ca1325639b0341521f2057e6e2f3b52241a6
[3/4] clk: qcom: convert drivers over to use subsys_platform_driver()
      commit: 51c6b675682a9cf5546fb057fed8f99361b56cf2
[4/4] clk: renesas: convert drivers over to use subsys_platform_driver()
      commit: d11a91e088cefa4b56d7877b49492d8e1dc818dc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
