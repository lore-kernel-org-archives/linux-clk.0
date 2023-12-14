Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E167273FD;
	Thu, 14 Dec 2023 21:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="ZTEFJ7oF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9ID6E51wXAKn7Ezg5ykW3DY/29a9sY2cYsFnqwiNNi8=; b=ZTEFJ7oFYCxmuqRe9pouzKHXcM
	vA49XHnKOrNMfyKjL/tqpbbQZjfGxyIxA9U5quw/GkIHoTPr6sg7MeqpJlyCoNkO3LTM3D6zn4XZA
	6EVxoMLNssmFdaiZjjLfTNClUTILmaeRWhL8ut/m7/aVnwVkyENWBaWYAo8UZCCN2mgWXgcHxBrBg
	o0xf3W7nRBfhQy7vOn+1e381I/5qZPNIjC6oyLw4UjVAgvhAmQYTr8CkXlIaOQ0tqDwJR4G2sgEmC
	p5IwkjnM3ZPQkynrBNWaQD6P3pwx2kkcIh9KzGLAJ6cTQ2YRykOiAgtGpRmuO4LX4iGsCO0mnP5Xx
	qHY+QUAA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rDsyl-00CSEB-03;
	Thu, 14 Dec 2023 21:10:47 +0000
Date: Thu, 14 Dec 2023 21:10:46 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: microchip: mpfs-ccc: replace include of
 asm-generic/errno-base.h
Message-ID: <20231214211046.GS1674809@ZenIV>
References: <20231214-dipper-earshot-72eef3059961@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214-dipper-earshot-72eef3059961@spud>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Dec 14, 2023 at 10:59:57AM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> As evidenced by the fact that only 2 other drivers include this header,
> it is not a normal thing to do. Including the regular version of this
> header is far more conventional for drivers.

ACK.  Includes of asm-generic/anything.h are fine in arch/*/include/*
and (under some circumstances) in include/*; anywhere else they are very
dubious, including outright bugs (io_uring/uring_cmd.h include
of asm-generic/ioctls.h, for example).
