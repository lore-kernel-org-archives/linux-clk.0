Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214CB31352C;
	Sat, 14 Feb 2026 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771092630; cv=none; b=o3hiGvQ9u4doiSPy8EUJv8xjFd+jkOXKnTxe6IgHLaH8urODWRR7gcXMf+eGwjocxDbR70lmlB/ytYY3bfksnUUdryvJ/dt5Xxlf4NKGKtdPR/DvZfB8qi9YHN5Du7GPUKaBxoYn1uECCvnOKBh3U6/jSQvLHImXppkapiNSiUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771092630; c=relaxed/simple;
	bh=hGg21hNdwfSVHjjadqjdQcAko5Jr38TIRFRNcPdSaao=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TjaHIGZU51bgavHu6MX8J+bA0GgbPB9kmn77STtMDJtsSdf9StfCLMRqYJAqwe/rrdDsutwzBFXjLeYR/OEYv926XP4ojsb2jQyvGHdVY/HInsgTIjhWxWUZwTNu+CBloCUzRlmcwxrbEsuhPrkM7Soh2271zE6XdmFbNkAduko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=lzWNZnmz; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="lzWNZnmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771092613; x=1771351813;
	bh=04vk7Tkl67/hhgMqv+BcDZRWNDj7PkIykfjIdYJisGI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lzWNZnmzltXz6nKdjeyNDHOlSQzkdIsgEGnJuEuAIh+ldTYFsToo1a3JptAUkBRzK
	 hVnnWL8OXZj55Idi+s7X6HaaUZ64MJDYSZl7/vP9T+KnnoUStrkI0couBie+1kl0+J
	 HoX5nVotwuTsv+X1bHagi6PvugvvER0ewJWICrK1vfg/acODaJyjiwQ9H0kk2N3WBr
	 doGNWDaC2wirfvlYWgMnh3FLeP9dflQrMW6u3T/3tNJXikg+Sqv66J/JBmH3CI5L5t
	 sc09AcozxpqhCC/QgjCiPnawGU6cXvwfKfiFbrBalo/ZHPl+0cBh9JHBbt94zRUq7T
	 I1TghprY9gVLw==
Date: Sat, 14 Feb 2026 18:10:09 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v4 0/2] clk: clocking-wizard: add user clock monitor support
Message-ID: <20260214180933.42143-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 33811916af14432e3496307dc748448316a346c8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add support for the clock monitor functionality added in version 6.0 of the
Xilinx clocking wizard IP core, through use of devcoredump.

This is a follow up from a patchset I submitted quite a while ago [1],
where I was attempting to utilise the UIO subsystem instead. Stephen Boyd
suggested use of devcoredump instead [2] and I have finally got round to
giving this a go.

This is currently untested on hardware, so any help testing this would be
much appreciated!

v3 -> v4:
- Patches 1-4,8-9 dropped, as they were submitted/accepted separately [3]
- Patch 7 removed, as no longer creating a new UIO driver
- DT binding patch mostly unchanged. Slight rework and rebase, so removed
  Krzysztof's R-b tag just in case
- Clock monitor support patch now reworked to make use of devcoredump
- Rebased on top of clk-next
v2 -> v3:
- Move kernel doc variable comment to bottom in clk_hw transition patch (2)
- Remove extra line (and add Krzysztof's R-b tag) in binding patch (5)
- Add Krzysztof's A-b tag to dynamic reconfig binding patch (8)
v1 -> v2:
- Split and improve clk_hw+devres transition patch (2+3)
- Fix/improve DT binding patches (5+8)
- Utilise auxiliary bus in monitor support patch (6)
- Add dedicated UIO driver for monitor support (7)

[1]: https://lore.kernel.org/linux-clk/20240826123602.1872-1-hpausten@proto=
nmail.com/
[2]: https://lore.kernel.org/linux-clk/1bd17a02bab46391872e4934895b83e8.sbo=
yd@kernel.org/
[3]: https://lore.kernel.org/linux-clk/20240913191037.2690-1-hpausten@proto=
nmail.com/

Harry Austen (2):
  dt-bindings: clock: xilinx: add description of user monitor interrupt
  clk: clocking-wizard: add user clock monitor support

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 ++++++-
 drivers/clk/xilinx/Kconfig                    |  1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 69 +++++++++++++++++--
 3 files changed, 89 insertions(+), 5 deletions(-)
---
base-commit: ea7282e99ead6d2a294cef40acd2a29ada3ab71d

--=20
2.53.0


