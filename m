Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924EF3BFE2A
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759583; cv=none; b=OSlBpa81NS5W0jkJJGG1/O0J3ZoAuL0GmoRasJdAF/HnPJFQtchYH6cebaYoHy59hYfPeEm1GjM9RNHqWHtkDEn6mzw0hgVVbE6Dfjz7QgQ9bv2F/huvyDCfviLNCQv/cWFUTj0/ztbKqjpvkIzIG7eVL6JwBIporhN4w0ddikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759583; c=relaxed/simple;
	bh=rc3F38niV6Jz71yriF1+hndfNRVS9oHFtAWBR7nnoZw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ib9mD5CocHxK2W85crECstIYduH3oaYh7vH/+NWTBQ6HqAQO8/6dZyGbfdw0DdzS2JV2c3eNsRqfplNn+mbLRrtqUViEBv23pgUTWhc8O05bnBDJqxatUcWmgaosCSIh8gaI8c5h7jq1x/Hzgnq+nu9+PZk8U1vsfCndbiOLSg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GV27zS/j; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GV27zS/j"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E40D31A107C;
	Wed, 30 Sep 2026 09:12:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B18FA60749;
	Wed, 30 Sep 2026 09:12:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C528103293CE;
	Wed, 30 Sep 2026 11:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790759578; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rc3F38niV6Jz71yriF1+hndfNRVS9oHFtAWBR7nnoZw=;
	b=GV27zS/j4JL4iMt8lEeOPOxRs012H2H+tm0XNIPds64WLlMdO4anU8HSXuoGrnu9PG9OtF
	2io5aCOh7PKczgydtb5EosfzMz2fW1A0j7vaodjqrU+XHMdB0OEiiTQHo/dTuTwoG8YNcl
	2H9jLLdd9A/ACYR7IAD/vIjtJCdrYSdppCtDr2WLm7UKMIBifpR5sJNCcWcU+CB+82cxve
	vths9/Pj0U0ymepEXSq7ZsWEK8SJrBSeqq8+SUMacntYD+QUBkmMBFUmIlZhkTrme5k49D
	Izo1puX7+4SZaoavhNP/gmdT1H7fPaY5y6BUbgEFmKQytqiHXm7zGfVtrJyClQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org,  sashiko-reviews@lists.linux.dev,
  devicetree@vger.kernel.org,  linux-clk@vger.kernel.org,
  conor+dt@kernel.org,  robh@kernel.org
Subject: Re: [PATCH v5 8/9] clk: nuvoton: ma35d1: get HXT/LXT from DT
In-Reply-To: <1jzewz2nng.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Wed, 30 Sep 2026 09:39:47 +0200")
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
	<20260929-perso-ma35d1-upstream-clk-v5-8-68533e935ee4@bootlin.com>
	<20260929145618.187A21F000FF@smtp.kernel.org>
	<871pab6bhn.fsf@bootlin.com>
	<1jzewz2nng.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 30 Sep 2026 11:12:56 +0200
Message-ID: <87v77ncdbb.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 30/09/2026 at 09:39:47 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On mar. 29 sept. 2026 at 22:36, Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
>
>> On 29/09/2026 at 14:56:17 GMT, sashiko-bot@kernel.org wrote:
>>
>>> Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
>>> - [High] clk: nuvoton: missing IS_ERR check causes permanent probe
>>> deferral
>>
>> Gasp. Yes that's correct.
>>
>>> - [Medium] clk: nuvoton: hardcoded parent strings cause orphaned gate
>>> clocks
>>
>> I don't think this one is serious, linkage is reliable because we
>> leverage the device tree nodes in the clk_core_get/clk_parse_spec
>> path. The fallback is indeed based on string matching, but heh, that's
>> because of backward compat, not my call.
>
> If think it is a legit warning.
>
> Here you say that your "hxt_gate" will parent to a clock named "hxt" in
> CCF, but you've got not guarantee that will be the name your externally
> provided clock.=20
>
> Its fw_name is stable for you but you should make any assumption how
> another module will name its clock.
>
> You should use parent_data here with .fw_name that will match the externa=
lly
> provided clock and .name as a fallback if the clock is actually provided
> internally

Ok, I believe I got your point. I can avoid any assumptions for the gate
clocks, because I have access to their parent 'hw'.

For the crystals, I see what you mean with the naming being global and
not enforced, that's true. I will continue expecting "the first clock"
to be hxt (already enforced by the bindings/existing DT). For the
second crystal, lxt, I will try a regular DT lookup (similar to the
.fw_name approach you mentioned) and fallback to an internally provided
block.

Thanks,
Miqu=C3=A8l
