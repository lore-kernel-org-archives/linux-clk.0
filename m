Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A92EC090;
	Sat, 11 Apr 2026 23:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775949722; cv=none; b=WsXAQLWe2mVJht/8PEWCmmBhJdlZ1v+u4xhWE5nvrY3Hk1wkm1HEyntt3TZVaO8zfIn12E0PvjyRgG/7Bwove0wYglFeyoLqG15j3KVHRXM3DWeiiKAMbEZ6LW71kjQEYvPEyhky31zRlDMtp0O5wv8R7sVxJs3a0NIwp0eg2Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775949722; c=relaxed/simple;
	bh=rW3eljFQ2w1417eQ5RRB3iSfPSyaCzJMXEdvaqfL6lM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aNlfpA6H4iYlGz1e6gKWKxCsZDCCYIR0Ks1BKN6O7JTTfSQ2EwpB9nHQS26/8eFpITc5TuocGvAy0NsMyrZB1z3v3U+MHI0FyPk/JW1ClGuHGOSEbzByrphSMFZJ5ZYVcUUnx0kieTCNnpDy68XdMFCCLIOVNEe3pgyCb4ShCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuR1v8C4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuR1v8C4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9713EC116C6;
	Sat, 11 Apr 2026 23:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775949721;
	bh=rW3eljFQ2w1417eQ5RRB3iSfPSyaCzJMXEdvaqfL6lM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nuR1v8C4xHALK6cpH79pgwwMkWRhE9n+qeU620HwdThjs5FKbIaQoKb6zuWJR0NFU
	 ItNVjpG/f/vHitD395KkxjhaxEo8Iq3h1ycbxnrl3cgazkrZ+G+jUoeedUa8j2f6pO
	 rhRX8azRNWIRFsSj/ywFE55O03aDG9LfH8KcRVuEhPh4j+pSi7Y1oLXkVK7sCiTIGi
	 RYnBcJz0JZRTwbEAz+i86/JqAFdlr3JBb9p3Lr5wz98F11Gz7UuThml9nyIm5z4Kd1
	 DpMW3P9tkyYQbaAvf2V60bjTr29MNFNwvdHElB55g74mu2uFrLDTlkrWSGJIV2C7mG
	 DmBbG6LOaw0lQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260325115111-KYC4742284@kernel.org>
References: <20260325115111-KYC4742284@kernel.org>
Subject: Re: [GIT PULL] clk: spacemit: Fixes for v7.0
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Shuwei Wu <shuwei.wu@mailbox.org>, linux-clk@vger.kernel.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
To: Yixun Lan <dlan@kernel.org>
Date: Sat, 11 Apr 2026 16:21:59 -0700
Message-ID: <177594971978.5403.2578935314797634605@lazor>
User-Agent: alot/0.12

Quoting Yixun Lan (2026-03-25 04:53:30)
> Hi Stephen,
>=20
>    Please pull SpacemiT's clock Fixes for v7.0
>=20
> Yixun Lan
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/spacemit-com/linux tags/spacemit-clk-fixes-for-7.0-1
>=20
> for you to fetch changes up to 54e97360b44bed6b4399dd3be3d65f392df940fa:
>=20
>   clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc() =
(2026-03-24 06:42:29 +0000)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
